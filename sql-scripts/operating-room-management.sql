SET @parent_location_id = (SELECT location_id FROM location WHERE name='Bahmni Hospital');

SET @or_location_tag_id = (SELECT location_tag_id FROM location_tag WHERE name='Operation Theater');

INSERT IGNORE INTO location (name, description, uuid, creator, date_created, retired, parent_location)
    VALUES  ("OR I", "OR I", UUID(), 1, NOW(), 0, @parent_location_id),
            ("OR II", "OR II", UUID(), 1, NOW(), 0, @parent_location_id),
            ("OR III", "OR III", UUID(), 1, NOW(), 0, @parent_location_id);

INSERT IGNORE INTO location_tag_map (location_id, location_tag_id)
    VALUES  ((SELECT location_id FROM location WHERE name='OR I'), @or_location_tag_id),
            ((SELECT location_id FROM location WHERE name='OR II'), @or_location_tag_id),
            ((SELECT location_id FROM location WHERE name='OR III'), @or_location_tag_id);