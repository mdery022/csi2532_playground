CREATE TABLE schema_migrations (
    migration varchar(255),
    migrated_at time,
    PRIMARY KEY (migration)
);

INSERT INTO schema_migrations (migration, migrated_at) VALUES
    ('20220224110700-create-athletes.sql', '2022-02-24 11:24:00');

INSERT INTO schema_migrations (migration, migrated_at) VALUES 
    ('20220224112300-create-migrations.sql', '2020-01-27 11:24:00');