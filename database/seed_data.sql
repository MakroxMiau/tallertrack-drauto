USE tallertrack_db;

-- ===== USUARIOS =====
INSERT INTO usuarios (rut, nombre, email, password_hash, rol) VALUES
('12.345.678-9', 'Carlos Mendoza', 'carlos.mendoza@gmail.com', '$2b$10$hash1', 'cliente'),
('9.876.543-2', 'María González', 'maria.gonzalez@gmail.com', '$2b$10$hash2', 'cliente'),
('15.234.567-K', 'Pedro Rojas', 'pedro.rojas@gmail.com', '$2b$10$hash3', 'cliente'),
('11.111.111-1', 'Jorge Canales', 'jorge.canales@duocuc.cl', '$2b$10$hash4', 'admin'),
('16.456.789-3', 'Andrés Silva', 'andres.silva@gmail.com', '$2b$10$hash5', 'mecanico'),
('14.789.123-5', 'Lucía Torres', 'lucia.torres@gmail.com', '$2b$10$hash6', 'mecanico');

-- ===== MECÁNICOS =====
INSERT INTO mecanicos (usuario_id, especialidad) VALUES
(5, 'Mecánica general y frenos'),
(6, 'Sistema eléctrico y diagnóstico');

-- ===== VEHÍCULOS =====
INSERT INTO vehiculos (patente, marca, modelo, anio, usuario_id) VALUES
('GHTB-23', 'Toyota', 'Corolla', 2019, 1),
('JKLP-45', 'Hyundai', 'Tucson', 2021, 2),
('MNQR-78', 'Chevrolet', 'Sail', 2018, 3);

-- ===== ÓRDENES DE TRABAJO =====
INSERT INTO ordenes_trabajo (vehiculo_id, cliente_id, mecanico_id, descripcion_falla, estado, fecha_recepcion, fecha_entrega_estimada) VALUES
(1, 1, 1, 'Ruido al frenar, posible desgaste de pastillas. Cliente reporta vibración en el pedal.', 'en_reparacion', '2026-09-15 09:30:00', '2026-09-22'),
(2, 2, 2, 'Luz de check engine encendida. Cliente indica pérdida de potencia en subidas.', 'diagnostico', '2026-09-18 14:00:00', '2026-09-25'),
(3, 3, 1, 'Cambio de aceite y filtros. Revisión general de 60.000 km.', 'listo', '2026-09-10 08:00:00', '2026-09-17');

-- ===== COMENTARIOS =====
INSERT INTO comentarios_ot (orden_id, texto) VALUES
(1, 'Se confirma desgaste de pastillas delanteras al 80%. Se recomienda cambio completo.'),
(1, 'Se desmontan pastillas y discos para revisión. Discos dentro de tolerancia.'),
(2, 'Se conecta escáner OBD-II. Código P0301 detectado: falla en cilindro 1.'),
(3, 'Cambio de aceite 5W-30 y filtros realizados. Vehículo en condiciones óptimas.');

-- ===== NOTIFICACIONES =====
INSERT INTO notificaciones (orden_id, usuario_id, mensaje, estado_envio, fecha_envio) VALUES
(1, 1, 'Su orden de trabajo N°1 ha pasado al estado: En Reparación.', 'enviado', '2026-09-19 10:00:00'),
(2, 2, 'Su orden de trabajo N°2 ha pasado al estado: Diagnóstico.', 'enviado', '2026-09-19 15:00:00'),
(3, 3, 'Su orden de trabajo N°3 está lista para entrega.', 'enviado', '2026-09-16 17:00:00');

-- ===== HISTORIAL DE ESTADOS (para timeline) =====
INSERT INTO historial_estados (orden_id, estado, fecha_cambio) VALUES
(1, 'recepcion', '2026-09-15 09:30:00'),
(1, 'diagnostico', '2026-09-15 14:00:00'),
(1, 'en_reparacion', '2026-09-19 10:00:00'),
(2, 'recepcion', '2026-09-18 14:00:00'),
(2, 'diagnostico', '2026-09-19 15:00:00'),
(3, 'recepcion', '2026-09-10 08:00:00'),
(3, 'diagnostico', '2026-09-10 10:00:00'),
(3, 'en_reparacion', '2026-09-10 11:00:00'),
(3, 'control_calidad', '2026-09-16 14:00:00'),
(3, 'listo', '2026-09-16 17:00:00');
