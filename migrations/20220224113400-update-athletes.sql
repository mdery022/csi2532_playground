ALTER TABLE athletes
    RENAME COLUMN identified_gender TO gender;

INSERT INTO schema_migrations (migration, migrated_at) VALUES
    ('20220224113400-update-athletes.sql', '2022-02-24 11:35:00'); 