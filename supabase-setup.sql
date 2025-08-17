-- Supabase Database Setup untuk Permit System
-- Jalankan script ini di SQL Editor Supabase

-- 1. Buat tabel permits
CREATE TABLE IF NOT EXISTS permits (
  permit_code TEXT PRIMARY KEY,
  plate TEXT,
  owner TEXT,
  type TEXT,
  valid_from DATE,
  valid_to DATE,
  stnk_exp DATE,
  simc_exp DATE,
  sima_exp DATE,
  status TEXT DEFAULT 'active',
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Buat tabel logs
CREATE TABLE IF NOT EXISTS logs (
  id SERIAL PRIMARY KEY,
  permit_code TEXT REFERENCES permits(permit_code) ON DELETE CASCADE,
  action TEXT NOT NULL,
  ts TIMESTAMPTZ DEFAULT NOW(),
  device_info TEXT,
  location TEXT
);

-- 3. Buat index untuk performa
CREATE INDEX IF NOT EXISTS idx_permits_plate ON permits(plate);
CREATE INDEX IF NOT EXISTS idx_permits_owner ON permits(owner);
CREATE INDEX IF NOT EXISTS idx_permits_status ON permits(status);
CREATE INDEX IF NOT EXISTS idx_logs_permit_code ON logs(permit_code);
CREATE INDEX IF NOT EXISTS idx_logs_ts ON logs(ts);

-- 4. Buat function untuk update timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

-- 5. Buat trigger untuk auto-update timestamp
CREATE TRIGGER update_permits_updated_at 
  BEFORE UPDATE ON permits 
  FOR EACH ROW 
  EXECUTE FUNCTION update_updated_at_column();

-- 6. Enable Row Level Security (RLS)
ALTER TABLE permits ENABLE ROW LEVEL SECURITY;
ALTER TABLE logs ENABLE ROW LEVEL SECURITY;

-- 7. Buat policies untuk permits
-- Policy untuk SELECT (semua user bisa lihat)
CREATE POLICY "Enable select for all users" ON permits
  FOR SELECT USING (true);

-- Policy untuk INSERT (hanya authenticated users)
CREATE POLICY "Enable insert for authenticated users" ON permits
  FOR INSERT WITH CHECK (auth.role() = 'authenticated');

-- Policy untuk UPDATE (hanya authenticated users)
CREATE POLICY "Enable update for authenticated users" ON permits
  FOR UPDATE USING (auth.role() = 'authenticated');

-- Policy untuk DELETE (hanya authenticated users)
CREATE POLICY "Enable delete for authenticated users" ON permits
  FOR DELETE USING (auth.role() = 'authenticated');

-- 8. Buat policies untuk logs
-- Policy untuk SELECT (semua user bisa lihat)
CREATE POLICY "Enable select for all users" ON logs
  FOR SELECT USING (true);

-- Policy untuk INSERT (hanya authenticated users)
CREATE POLICY "Enable insert for authenticated users" ON logs
  FOR INSERT WITH CHECK (auth.role() = 'authenticated');

-- 9. Buat function untuk generate permit_code otomatis
CREATE OR REPLACE FUNCTION generate_permit_code()
RETURNS TEXT AS $$
DECLARE
  new_code TEXT;
  counter INTEGER := 1;
BEGIN
  LOOP
    new_code := 'PERMIT-' || LPAD(counter::TEXT, 6, '0');
    
    -- Check if code already exists
    IF NOT EXISTS (SELECT 1 FROM permits WHERE permit_code = new_code) THEN
      RETURN new_code;
    END IF;
    
    counter := counter + 1;
    
    -- Safety check to prevent infinite loop
    IF counter > 999999 THEN
      RAISE EXCEPTION 'Cannot generate unique permit code';
    END IF;
  END LOOP;
END;
$$ LANGUAGE plpgsql;

-- 10. Buat view untuk data yang sering diakses
CREATE OR REPLACE VIEW permits_summary AS
SELECT 
  permit_code,
  plate,
  owner,
  type,
  status,
  valid_from,
  valid_to,
  stnk_exp,
  simc_exp,
  sima_exp,
  CASE 
    WHEN stnk_exp < CURRENT_DATE OR simc_exp < CURRENT_DATE OR sima_exp < CURRENT_DATE 
    THEN 'expired'
    ELSE 'active'
  END as expiry_status,
  created_at,
  updated_at
FROM permits
ORDER BY created_at DESC;

-- 11. Insert sample data (optional)
INSERT INTO permits (permit_code, plate, owner, type, valid_from, valid_to, stnk_exp, simc_exp, sima_exp, status) VALUES
('PERMIT-000001', 'B 1234 ABC', 'John Doe', 'MOTOR', '2024-01-01', '2025-01-01', '2025-06-01', '2026-01-01', '2026-01-01', 'active'),
('PERMIT-000002', 'B 5678 DEF', 'Jane Smith', 'MOBIL', '2024-01-01', '2025-01-01', '2025-08-01', '2026-03-01', '2026-03-01', 'active')
ON CONFLICT (permit_code) DO NOTHING;

-- 12. Buat function untuk bulk insert dari CSV
CREATE OR REPLACE FUNCTION bulk_insert_permits(
  permit_codes TEXT[],
  plates TEXT[],
  owners TEXT[],
  types TEXT[],
  valid_froms DATE[],
  valid_tos DATE[],
  stnk_exps DATE[],
  simc_exps DATE[],
  sima_exps DATE[],
  statuses TEXT[]
)
RETURNS INTEGER AS $$
DECLARE
  i INTEGER;
  inserted_count INTEGER := 0;
BEGIN
  FOR i IN 1..array_length(permit_codes, 1) LOOP
    INSERT INTO permits (
      permit_code, plate, owner, type, 
      valid_from, valid_to, stnk_exp, simc_exp, sima_exp, status
    ) VALUES (
      permit_codes[i], plates[i], owners[i], types[i],
      valid_froms[i], valid_tos[i], stnk_exps[i], simc_exps[i], sima_exps[i], 
      COALESCE(statuses[i], 'active')
    )
    ON CONFLICT (permit_code) DO UPDATE SET
      plate = EXCLUDED.plate,
      owner = EXCLUDED.owner,
      type = EXCLUDED.type,
      valid_from = EXCLUDED.valid_from,
      valid_to = EXCLUDED.valid_to,
      stnk_exp = EXCLUDED.stnk_exp,
      simc_exp = EXCLUDED.simc_exp,
      sima_exp = EXCLUDED.sima_exp,
      status = EXCLUDED.status,
      updated_at = NOW();
    
    inserted_count := inserted_count + 1;
  END LOOP;
  
  RETURN inserted_count;
END;
$$ LANGUAGE plpgsql;

-- 13. Grant permissions (jika diperlukan)
-- GRANT USAGE ON SCHEMA public TO anon, authenticated;
-- GRANT ALL ON ALL TABLES IN SCHEMA public TO anon, authenticated;
-- GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO anon, authenticated;

-- 14. Verifikasi setup
SELECT 'Setup completed successfully' as status;
SELECT COUNT(*) as permits_count FROM permits;
SELECT COUNT(*) as logs_count FROM logs;
