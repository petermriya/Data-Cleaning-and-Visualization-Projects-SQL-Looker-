
/*Changing date formats*/

UPDATE safari_connect_clean

SET departure_date =

    CASE

        WHEN departure_date ~ '^\d{4}-\d{2}-\d{2}$'

            THEN TO_DATE(departure_date, 'YYYY-MM-DD')



        WHEN departure_date ~ '^\d{2}/\d{2}/\d{4}$'

            THEN TO_DATE(departure_date, 'DD/MM/YYYY')



        WHEN departure_date ~ '^\d{2}-\d{2}-\d{4}$'

            THEN TO_DATE(departure_date, 'MM-DD-YYYY')



        WHEN departure_date ~ '^\d{2}-\d{2}-\d{2}$'

            THEN TO_DATE(departure_date, 'DD-MM-YY')



        ELSE NULL

    END;


/*Changing date formats*/
UPDATE safari_connect_dirty 
SET passenger_name = INITCAP(TRIM(passenger_name))


/*Removing an extra spaces and ensuring the names start in caps*/
UPDATE safari_connect_dirty
SET passenger_name = TRIM (passenger_name)


/*Removing any characters that are not 0-9 in phone numbers*/
UPDATE safari_connect_dirty
SET passenger_phone = REGEXP_REPLACE(passenger_phone, '[^0-9]', '');

/*Replacing 254 with 0 in phone numbers*/
UPDATE safari_connect_dirty
SET passenger_phone = REGEXP_REPLACE(
    passenger_phone,
    '^254','0');

/*Replacing blanks with nulls*/
UPDATE safari_connect_dirty
SET passenger_phone = NULLIF(passenger_phone, '')

/*Changing date formats*/
UPDATE safari_connect_dirty
SET departure_date = TO_DATE(departure_date, 'YYYY-MM-DD')

/*Remove any extra spaces and ensuring city names start in caps*/
UPDATE safari_connect_dirty
SET passenger_city = INITCAP(TRIM(passenger_city))

/*Replacing Unknowns with blanks*/
UPDATE safari_connect_dirty
SET passenger_city = 'Unknown'
WHERE passenger_city = ''

/*Changing M to Male in the gender column*/
UPDATE safari_connect_dirty
SET passenger_gender =  'Male'
WHERE passenger_gender = 'M'

/*Changing F to Female in the gender column*/
UPDATE safari_connect_dirty
SET passenger_gender =  'Female'
WHERE passenger_gender = 'F' 

/*Remove any extra spaces and ensuring gender names start in caps*/
UPDATE safari_connect_dirty
SET passenger_gender = INITCAP(TRIM(passenger_gender))
