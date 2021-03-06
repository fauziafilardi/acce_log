PGDMP                         x            acc_db    11.1    11.2 g              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    209131    acc_db    DATABASE     �   CREATE DATABASE acc_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE acc_db;
             postgres    false                       1255    210957 G   _getlogin_auth(character varying, character varying, character varying)    FUNCTION       CREATE FUNCTION public._getlogin_auth(p_user_id character varying, p_password character varying, p_subportfolio_short_name character varying DEFAULT ''::character varying) RETURNS TABLE(user_id character varying, is_inactive character varying, user_name character varying, path_file character varying, password character varying, user_group_short_descs character varying, user_group_descs character varying, subportfolio_short_name character varying, subportfolio_name character varying, portfolio_short_name character varying, portfolio_name character varying, default_language character varying, ss_group_id integer, portfolio_id integer, subportfolio_id integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 
	
   /* IF p_subportfolio_cd = '' THEN
    	SELECT x.subportfolio_cd into p_subportfolio_cd
        FROM ss_user_subportfolio x
        WHERE x.default_login_status ='Y'
        AND x.user_id iLIKE p_user_id;
    END IF;*/

      RETURN QUERY                
      SELECT    
       a.user_id    
         ,a.is_inactive    
         ,a.user_name    
         ,a.path_file
         ,a.password
         ,sg.short_descs as user_group_short_descs    
         ,sg.descs AS user_group_descs    
         ,c.short_name as  subportfolio_short_name
         ,c.name AS subportfolio_name    
         ,f.short_name as portfolio_short_name    
         ,f.name AS portfolio_name      
         ,COALESCE (a.default_language,'en')  as default_language
         ,a.ss_group_id
         ,a.portfolio_id
         ,a.subportfolio_id
      FROM SS_User a     
      INNER JOIN ss_subportfolio c
       ON a.subportfolio_id = c.ss_subportfolio_id     
      INNER JOIN ss_portfolio f 
       ON a.portfolio_id = f.ss_portfolio_id
      INNER JOIN ss_group sg 
       ON a.ss_group_id = sg.ss_group_id    
      WHERE a.user_id iLIKE p_user_id
      AND a.password = p_password    
      AND a.is_inactive = 'N';    
/*      AND b.subportfolio_cd iLIKE p_subportfolio_cd    */
	 
	
    

END;
$$;
 �   DROP FUNCTION public._getlogin_auth(p_user_id character varying, p_password character varying, p_subportfolio_short_name character varying);
       public       postgres    false                       1255    211054     fcm_contact2_s(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fcm_contact2_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(cm_contact_id integer, ss_portfolio_id integer, contact_type character, contact_status character, contact_created timestamp without time zone, name__tb_1 character varying, address__tb_2 character varying, ss_country_id__lo_6 integer, country__lbl__lo_6 character varying, ss_province_id__lo_5 integer, province__lbl__lo_5 character varying, ss_city_id__lo_4 integer, city__lbl__lo_4 character varying, ss_district_id__lo_3 integer, district__lbl__lo_3 character varying, phone_no__tb_7 character varying, email__tb_8 character varying, website__tb_9 character varying, contact_person__tb_10 character varying, contact_phone_no__tb_11 character varying, cm_customer_status_id__lo_12 integer, customer_status__lbl__lo_12 character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer, file_name character varying, path_file character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.cm_contact_id,
               a.ss_portfolio_id,
               a.contact_type,
               a.contact_status,
               a.contact_created,
               a.name as name__tb_1,
               a.address as address__tb_2,
               a.ss_country_id as ss_country_id__lo_6,
               b.descs as country__lbl__lo_6,
               a.ss_province_id as ss_province_id__lo_5,
               c.descs as province__lbl__lo_5,
               a.ss_city_id as ss_city_id__lo_4,
               d.descs as city__lbl__lo_4,
               a.ss_district_id as ss_district_id__lo_3,
               e.descs as district__lbl__lo_3,
               a.phone_no as phone_no__tb_7,
               a.email as email__tb_8,
               a.website as website__tb_9,
               a.contact_person as contact_person__tb_10,
               a.contact_phone_no as contact_phone_no__tb_11,
               a.cm_customer_status_id as cm_customer_status_id__lo_12,
               f.descs as customer_status__lbl__lo_12,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.cm_contact_id as row_id,
               a.xmin::text::integer as lastupdatestamp,
               a.file_name,
               a.path_file
          FROM cm_contact a inner join ss_country b on a.ss_country_id = b.ss_country_id
          inner  join ss_province c on a.ss_province_id = c.ss_province_id
          inner  join ss_city d on a.ss_city_id = d.ss_city_id
          inner  join ss_district e on a.ss_district_id = e.ss_district_id
          inner join cm_customer_status f on a.cm_customer_status_id = f.cm_customer_status_id
          WHERE a.cm_contact_id = p_row_id
          and  a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 R   DROP FUNCTION public.fcm_contact2_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            x           1255    209413    fcm_contact_d(integer, integer)    FUNCTION     x  CREATE FUNCTION public.fcm_contact_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM cm_contact
    WHERE xmin::text::integer = p_lastupdatestamp   
		and cm_contact_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 Q   DROP FUNCTION public.fcm_contact_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210625 *  fcm_contact_i(integer, character, character, character varying, character varying, integer, integer, integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, character varying)    FUNCTION     `  CREATE FUNCTION public.fcm_contact_i(p_ss_portfolio_id integer, p_contact_type character, p_contact_status character, p_name character varying, p_address character varying, p_ss_country_id integer, p_ss_province_id integer, p_ss_city_id integer, p_ss_district_id integer, p_phone_no character varying, p_email character varying, p_website character varying, p_contact_person character varying, p_contact_phone_no character varying, p_file_name character varying, p_path_file character varying, p_cm_customer_status_id integer, p_marketing_id character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_id integer;
begin

  		INSERT INTO 
  public.cm_contact
    (
          ss_portfolio_id, 
          contact_type, 
          contact_status, 
          contact_created, 
          name, 
          address, 
          ss_country_id, 
          ss_province_id, 
          ss_city_id, 
          ss_district_id, 
          phone_no, 
          email, 
          website, 
          contact_person, 
          contact_phone_no, 
          file_name,
          path_file,
          cm_customer_status_id,
          marketing_id,
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_portfolio_id,
          p_contact_type,
          p_contact_status,
          now(),
          p_name,
          p_address,
          p_ss_country_id,
          p_ss_province_id,
          p_ss_city_id,
          p_ss_district_id,
          p_phone_no,
          p_email,
          p_website,
          p_contact_person,
          p_contact_phone_no,
          p_file_name,
          p_path_file,
          p_cm_customer_status_id,
          p_marketing_id,
          p_user_input,
          p_user_input
  );
  
    
    SELECT currval(pg_get_serial_sequence('cm_contact', 'cm_contact_id'))::integer into v_id;
    
    /* insert cm_contact_person*/
    PERFORM fcm_contact_person_i(v_id,p_contact_person,p_contact_phone_no,p_email,p_user_input);
    
     
    RETURN QUERY
    select v_id as row_id;
    
end;
$$;
 P  DROP FUNCTION public.fcm_contact_i(p_ss_portfolio_id integer, p_contact_type character, p_contact_status character, p_name character varying, p_address character varying, p_ss_country_id integer, p_ss_province_id integer, p_ss_city_id integer, p_ss_district_id integer, p_phone_no character varying, p_email character varying, p_website character varying, p_contact_person character varying, p_contact_phone_no character varying, p_file_name character varying, p_path_file character varying, p_cm_customer_status_id integer, p_marketing_id character varying, p_user_input character varying);
       public       postgres    false                       1255    211055 '   fcm_contact_person2_s(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fcm_contact_person2_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(cm_contact_person_id integer, cm_contact_id integer, name__tb_1 character varying, phone_no__tb_2 character varying, email__tb_3 character varying, "position" character varying, descs character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.cm_contact_person_id,
               a.cm_contact_id,
               a.name as name__tb_1,
               a.phone_no as phone_no__tb_2,
               a.email as email__tb_3, 
               a.position,
               a.descs,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.cm_contact_person_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM cm_contact_person a 
          WHERE a.cm_contact_person_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 Y   DROP FUNCTION public.fcm_contact_person2_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209980 &   fcm_contact_person_d(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fcm_contact_person_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM cm_contact_person
    WHERE xmin::text::integer = p_lastupdatestamp   
		and cm_contact_person_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 X   DROP FUNCTION public.fcm_contact_person_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209992 �   fcm_contact_person_from_contact_u(integer, character varying, character varying, character varying, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.fcm_contact_person_from_contact_u(p_cm_contact_id integer, p_contact_person character varying, p_name character varying, p_phone_no character varying, p_email character varying, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.cm_contact_person set
               name = p_name,
               phone_no = p_phone_no,
               email = p_email,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE name = p_contact_person
        AND cm_contact_id = p_cm_contact_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fcm_contact_person_from_contact_u(p_cm_contact_id integer, p_contact_person character varying, p_name character varying, p_phone_no character varying, p_email character varying, p_user_edit character varying);
       public       postgres    false                       1255    210904 �   fcm_contact_person_i(integer, character varying, character varying, character varying, character varying, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.fcm_contact_person_i(p_cm_contact_id integer, p_name character varying, p_phone_no character varying, p_email character varying, p_position character varying, p_descs character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.cm_contact_person
    (
          cm_contact_id, 
          name, 
          phone_no, 
          email, 
          position,
          descs,
          user_input, 
          user_edit
    )
  VALUES (
          p_cm_contact_id,
          p_name,
          p_phone_no,
          p_email,
          p_position,
          p_descs,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('cm_contact_person', 'cm_contact_person_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fcm_contact_person_i(p_cm_contact_id integer, p_name character varying, p_phone_no character varying, p_email character varying, p_position character varying, p_descs character varying, p_user_input character varying);
       public       postgres    false            �           1255    210911 &   fcm_contact_person_s(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fcm_contact_person_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(cm_contact_person_id integer, cm_contact_id integer, name character varying, phone_no character varying, email character varying, "position" character varying, descs character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.cm_contact_person_id,
               a.cm_contact_id,
               a.name,
               a.phone_no,
               a.email, 
               a.position,
               a.descs,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.cm_contact_person_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM cm_contact_person a 
          WHERE a.cm_contact_person_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 X   DROP FUNCTION public.fcm_contact_person_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false                       1255    210905 �   fcm_contact_person_u(integer, integer, character varying, character varying, character varying, character varying, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fcm_contact_person_u(p_cm_contact_person_id integer, p_cm_contact_id integer, p_name character varying, p_phone_no character varying, p_email character varying, p_position character varying, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.cm_contact_person set
               cm_contact_id = p_cm_contact_id,
               name = p_name,
               phone_no = p_phone_no,
               email = p_email,
               position = p_position,
               descs = p_descs,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND cm_contact_person_id = p_cm_contact_person_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 *  DROP FUNCTION public.fcm_contact_person_u(p_cm_contact_person_id integer, p_cm_contact_id integer, p_name character varying, p_phone_no character varying, p_email character varying, p_position character varying, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210496    fcm_contact_s(integer, integer)    FUNCTION      
  CREATE FUNCTION public.fcm_contact_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(cm_contact_id integer, ss_portfolio_id integer, contact_type character, contact_status character, contact_created timestamp without time zone, name character varying, address character varying, ss_country_id integer, country character varying, ss_province_id integer, province character varying, ss_city_id integer, city character varying, ss_district_id integer, district character varying, phone_no character varying, email character varying, website character varying, contact_person character varying, contact_phone_no character varying, cm_customer_status_id integer, customer_status character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer, file_name character varying, path_file character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.cm_contact_id,
               a.ss_portfolio_id,
               a.contact_type,
               a.contact_status,
               a.contact_created,
               a.name,
               a.address,
               a.ss_country_id,
               b.descs as country,
               a.ss_province_id,
               c.descs as province,
               a.ss_city_id,
               d.descs as city,
               a.ss_district_id,
               e.descs as district,
               a.phone_no,
               a.email,
               a.website,
               a.contact_person,
               a.contact_phone_no,
               a.cm_customer_status_id,
               f.descs as customer_status,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.cm_contact_id as row_id,
               a.xmin::text::integer as lastupdatestamp,
               a.file_name,
               a.path_file
          FROM cm_contact a inner join ss_country b on a.ss_country_id = b.ss_country_id
          inner  join ss_province c on a.ss_province_id = c.ss_province_id
          inner  join ss_city d on a.ss_city_id = d.ss_city_id
          inner  join ss_district e on a.ss_district_id = e.ss_district_id
          inner join cm_customer_status f on a.cm_customer_status_id = f.cm_customer_status_id
          WHERE a.cm_contact_id = p_row_id
          and  a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 Q   DROP FUNCTION public.fcm_contact_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210626 &  fcm_contact_u(integer, integer, character varying, character varying, integer, integer, integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fcm_contact_u(p_cm_contact_id integer, p_ss_portfolio_id integer, p_name character varying, p_address character varying, p_ss_country_id integer, p_ss_province_id integer, p_ss_city_id integer, p_ss_district_id integer, p_phone_no character varying, p_email character varying, p_website character varying, p_contact_person character varying, p_contact_phone_no character varying, p_file_name character varying, p_path_file character varying, p_cm_customer_status_id integer, p_marketing_id character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;v_count_person integer=0;v_contact_person varchar(60)='';

begin	

	select x.contact_person into v_contact_person
    from cm_contact x
    where x.xmin::text::integer = p_lastupdatestamp
        AND x.cm_contact_id = p_cm_contact_id;   
    
    select count(1) into v_count_person  from cm_contact_person a
    where a.cm_contact_id = p_cm_contact_id
    AND a.name iLIKE v_contact_person;
    
    IF v_count_person > 0 THEN
    	PERFORM fcm_contact_person_from_contact_u(p_cm_contact_id,v_contact_person,p_contact_person,p_contact_phone_no,p_email,p_user_edit);
    END IF;
         
        UPDATE  public.cm_contact set
               ss_portfolio_id = p_ss_portfolio_id,
               name = p_name,
               address = p_address,
               ss_country_id = p_ss_country_id,
               ss_province_id = p_ss_province_id,
               ss_city_id = p_ss_city_id,
               ss_district_id = p_ss_district_id,
               phone_no = p_phone_no,
               email = p_email,
               website = p_website,
               contact_person = p_contact_person,
               contact_phone_no = p_contact_phone_no,
               file_name = p_file_name,
          	   path_file = p_path_file,
               cm_customer_status_id = p_cm_customer_status_id,
               marketing_id = p_marketing_id,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND cm_contact_id = p_cm_contact_id;    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    
    return v_count;
end;
$$;
 M  DROP FUNCTION public.fcm_contact_u(p_cm_contact_id integer, p_ss_portfolio_id integer, p_name character varying, p_address character varying, p_ss_country_id integer, p_ss_province_id integer, p_ss_city_id integer, p_ss_district_id integer, p_phone_no character varying, p_email character varying, p_website character varying, p_contact_person character varying, p_contact_phone_no character varying, p_file_name character varying, p_path_file character varying, p_cm_customer_status_id integer, p_marketing_id character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210454 '   fcm_customer_status_d(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fcm_customer_status_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM cm_customer_status
    WHERE xmin::text::integer = p_lastupdatestamp   
		and cm_customer_status_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 Y   DROP FUNCTION public.fcm_customer_status_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210446 +   fcm_customer_status_dtl_d(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fcm_customer_status_dtl_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM cm_customer_status_dtl
    WHERE xmin::text::integer = p_lastupdatestamp   
		and cm_customer_status_dtl_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 ]   DROP FUNCTION public.fcm_customer_status_dtl_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            f           1255    210460 &   fcm_customer_status_dtl_d_all(integer)    FUNCTION     m  CREATE FUNCTION public.fcm_customer_status_dtl_d_all(p_cm_customer_status_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM cm_customer_status_dtl
    WHERE cm_customer_status_id = p_cm_customer_status_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 U   DROP FUNCTION public.fcm_customer_status_dtl_d_all(p_cm_customer_status_id integer);
       public       postgres    false            �           1255    210523 e   fcm_customer_status_dtl_i(integer, character, character varying, integer, integer, character varying)    FUNCTION     a  CREATE FUNCTION public.fcm_customer_status_dtl_i(p_cm_customer_status_id integer, p_action_type character, p_action character varying, p_month integer, p_freq integer, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.cm_customer_status_dtl
    (
          cm_customer_status_id, 
          action_type,
          action, 
          month, 
          freq, 
          user_input, 
          user_edit
    )
  VALUES (
          p_cm_customer_status_id,
          p_action_type,
          p_action,
          p_month,
          p_freq,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('cm_customer_status_dtl', 'cm_customer_status_dtl_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fcm_customer_status_dtl_i(p_cm_customer_status_id integer, p_action_type character, p_action character varying, p_month integer, p_freq integer, p_user_input character varying);
       public       postgres    false            �           1255    210447 +   fcm_customer_status_dtl_s(integer, integer)    FUNCTION     G  CREATE FUNCTION public.fcm_customer_status_dtl_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(cm_customer_status_dt_id integer, cm_customer_status_id integer, action character varying, month integer, freq integer, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.cm_customer_status_dt_id,
               a.cm_customer_status_id,
               a.action,
               a.month,
               a.freq,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.cm_customer_status_dt_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM cm_customer_status_dtl a 
          WHERE a.cm_customer_status_dtl_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 ]   DROP FUNCTION public.fcm_customer_status_dtl_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210524 w   fcm_customer_status_dtl_u(integer, integer, character, character varying, integer, integer, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fcm_customer_status_dtl_u(p_cm_customer_status_dt_id integer, p_cm_customer_status_id integer, p_action_type character, p_action character varying, p_month integer, p_freq integer, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.cm_customer_status_dtl set
               cm_customer_status_id = p_cm_customer_status_id,
               action_type = p_action_type,
               action = p_action,
               month = p_month,
               freq = p_freq,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND cm_customer_status_dtl_id = p_cm_customer_status_dtl_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
   DROP FUNCTION public.fcm_customer_status_dtl_u(p_cm_customer_status_dt_id integer, p_cm_customer_status_id integer, p_action_type character, p_action character varying, p_month integer, p_freq integer, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210760 �   fcm_customer_status_i(integer, character varying, character varying, character varying, integer, integer, integer, integer, integer, integer, character varying)    FUNCTION     	  CREATE FUNCTION public.fcm_customer_status_i(p_ss_portfolio_id integer, p_descs character varying, p_customer_status_cd character varying, p_customer_status_colour character varying, p_call_qty integer, p_call_month integer, p_visit_qty integer, p_visit_month integer, p_entertain_qty integer, p_entertain_month integer, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer; v_id integer;
begin

if p_call_qty is null then
	p_call_qty := 0;
end if;   

if p_call_month is null then
	p_call_month := 0;
end if;  

if p_visit_qty is null then
	p_visit_qty := 0;
end if;  

if p_visit_month is null then
	p_visit_month := 0;
end if;  

if p_entertain_qty is null then
	p_entertain_qty := 0;
end if;  

if p_entertain_month is null then
	p_entertain_month := 0;
end if;  



  		INSERT INTO public.cm_customer_status
    (
          ss_portfolio_id, 
          descs, 
          customer_status_cd,
          customer_status_colour,
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_portfolio_id,
          p_descs,
          p_customer_status_cd,
          p_customer_status_colour,
          p_user_input,
          p_user_input
  );
    
    
    SELECT currval(pg_get_serial_sequence('cm_customer_status', 'cm_customer_status_id'))::integer as row_id INTO v_id;

	RAISE NOTICE 'value of v_id : %', v_id; 
    
    PERFORM public.fcm_customer_status_dtl_i(v_id,	'C',	'Call',
                                     p_call_month, p_call_qty,	p_user_input);
                                             
    PERFORM public.fcm_customer_status_dtl_i(v_id,	'V',	'Visit',
                                     p_visit_month, p_visit_qty,	p_user_input);
                                             
    PERFORM public.fcm_customer_status_dtl_i(v_id,	'E',	'Entertainment',
                                     p_entertain_month, p_entertain_qty,	p_user_input);   
                                     
 	RETURN QUERY       
    select v_id as row_id;                                                                                                                    
                                             
                                             

end;
$$;
 `  DROP FUNCTION public.fcm_customer_status_i(p_ss_portfolio_id integer, p_descs character varying, p_customer_status_cd character varying, p_customer_status_colour character varying, p_call_qty integer, p_call_month integer, p_visit_qty integer, p_visit_month integer, p_entertain_qty integer, p_entertain_month integer, p_user_input character varying);
       public       postgres    false            �           1255    210765 '   fcm_customer_status_s(integer, integer)    FUNCTION     *  CREATE FUNCTION public.fcm_customer_status_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(cm_customer_status_id integer, ss_portfolio_id integer, descs character varying, customer_status_cd character varying, customer_status_colour character varying, action_call text, month_call integer, freq_call integer, action_visit text, month_visit integer, freq_visit integer, action_entertain text, month_entertain integer, freq_entertain integer, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.cm_customer_status_id,
               a.ss_portfolio_id,
               a.descs,
               a.customer_status_cd,
               a.customer_status_colour,
          		(select MAX(b.action)
                from public.cm_customer_status_dtl b
                where b.action_type = 'C'
                and b.cm_customer_status_id = a.cm_customer_status_id) as action_call, 
          		(select MAX(b.month)
                from public.cm_customer_status_dtl b
                where b.action_type = 'C'
                and b.cm_customer_status_id = a.cm_customer_status_id) as month_call, 
          		(select MAX(b.freq)
                from public.cm_customer_status_dtl b
                where b.action_type = 'C'
                and b.cm_customer_status_id = a.cm_customer_status_id) as freq_call,                                 
          		(select MAX(b.action)
                from public.cm_customer_status_dtl b
                where b.action_type = 'V'
                and b.cm_customer_status_id = a.cm_customer_status_id) as action_visit, 
          		(select MAX(b.month)
                from public.cm_customer_status_dtl b
                where b.action_type = 'V'
                and b.cm_customer_status_id = a.cm_customer_status_id) as month_visit, 
          		(select MAX(b.freq)
                from public.cm_customer_status_dtl b
                where b.action_type = 'V'
                and b.cm_customer_status_id = a.cm_customer_status_id) as freq_visit,  
          		(select MAX(b.action)
                from public.cm_customer_status_dtl b
                where b.action_type = 'E'
                and b.cm_customer_status_id = a.cm_customer_status_id) as action_entertain, 
          		(select MAX(b.month)
                from public.cm_customer_status_dtl b
                where b.action_type = 'E'
                and b.cm_customer_status_id = a.cm_customer_status_id) as month_entertain, 
          		(select MAX(b.freq)
                from public.cm_customer_status_dtl b
                where b.action_type = 'E'
                and b.cm_customer_status_id = a.cm_customer_status_id) as freq_entertain,                  
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.cm_customer_status_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM cm_customer_status a 
          WHERE a.cm_customer_status_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 Y   DROP FUNCTION public.fcm_customer_status_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210761 �   fcm_customer_status_u(integer, integer, character varying, character varying, character varying, integer, integer, integer, integer, integer, integer, integer, character varying)    FUNCTION     K	  CREATE FUNCTION public.fcm_customer_status_u(p_cm_customer_status_id integer, p_ss_portfolio_id integer, p_descs character varying, p_customer_status_cd character varying, p_customer_status_colour character varying, p_call_qty integer, p_call_month integer, p_visit_qty integer, p_visit_month integer, p_entertain_qty integer, p_entertain_month integer, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	

        if p_call_qty is null then
            p_call_qty := 0;
        end if;   

        if p_call_month is null then
            p_call_month := 0;
        end if;  

        if p_visit_qty is null then
            p_visit_qty := 0;
        end if;  

        if p_visit_month is null then
            p_visit_month := 0;
        end if;  

        if p_entertain_qty is null then
            p_entertain_qty := 0;
        end if;  

        if p_entertain_month is null then
            p_entertain_month := 0;
        end if;  
    
         
        UPDATE  public.cm_customer_status set
               ss_portfolio_id = p_ss_portfolio_id,
               descs = p_descs,
               customer_status_cd = p_customer_status_cd,
               customer_status_colour = p_customer_status_colour,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND cm_customer_status_id = p_cm_customer_status_id;
        
        DELETE FROM cm_customer_status_dtl
        WHERE cm_customer_status_id = p_cm_customer_status_id;        
        
        PERFORM public.fcm_customer_status_dtl_i(p_cm_customer_status_id,	'C',	'Call',
                                     p_call_month, p_call_qty,	p_user_edit);
                                             
        PERFORM public.fcm_customer_status_dtl_i(p_cm_customer_status_id,	'V',	'Visit',
                                         p_visit_month, p_visit_qty,	p_user_edit);
                                                 
        PERFORM public.fcm_customer_status_dtl_i(p_cm_customer_status_id,	'E',	'Entertainment',
                                         p_entertain_month, p_entertain_qty,	p_user_edit);   
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �  DROP FUNCTION public.fcm_customer_status_u(p_cm_customer_status_id integer, p_ss_portfolio_id integer, p_descs character varying, p_customer_status_cd character varying, p_customer_status_colour character varying, p_call_qty integer, p_call_month integer, p_visit_qty integer, p_visit_month integer, p_entertain_qty integer, p_entertain_month integer, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    209867    fcm_reason_d(integer, integer)    FUNCTION     u  CREATE FUNCTION public.fcm_reason_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM cm_reason
    WHERE xmin::text::integer = p_lastupdatestamp   
		and cm_reason_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 P   DROP FUNCTION public.fcm_reason_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209865 a   fcm_reason_i(integer, character varying, character varying, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.fcm_reason_i(p_ss_portfolio_id integer, p_module_cd character varying, p_reason_cd character varying, p_descs character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.cm_reason
    (
          ss_portfolio_id, 
          module_cd, 
          reason_cd, 
          descs, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_portfolio_id,
          p_module_cd,
          p_reason_cd,
          p_descs,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('cm_reason', 'cm_reason_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fcm_reason_i(p_ss_portfolio_id integer, p_module_cd character varying, p_reason_cd character varying, p_descs character varying, p_user_input character varying);
       public       postgres    false            �           1255    209868    fcm_reason_s(integer, integer)    FUNCTION       CREATE FUNCTION public.fcm_reason_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(cm_reason_id integer, ss_portfolio_id integer, module_cd character varying, reason_cd character varying, descs character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.cm_reason_id,
               a.ss_portfolio_id,
               a.module_cd,
               a.reason_cd,
               a.descs,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.cm_reason_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM cm_reason a 
          WHERE a.cm_reason_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 P   DROP FUNCTION public.fcm_reason_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209866 s   fcm_reason_u(integer, integer, character varying, character varying, character varying, integer, character varying)    FUNCTION     &  CREATE FUNCTION public.fcm_reason_u(p_cm_reason_id integer, p_ss_portfolio_id integer, p_module_cd character varying, p_reason_cd character varying, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.cm_reason set
               ss_portfolio_id = p_ss_portfolio_id,
               module_cd = p_module_cd,
               reason_cd = p_reason_cd,
               descs = p_descs,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND cm_reason_id = p_cm_reason_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fcm_reason_u(p_cm_reason_id integer, p_ss_portfolio_id integer, p_module_cd character varying, p_reason_cd character varying, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210345 "   ffm_driver_doc_d(integer, integer)    FUNCTION     �  CREATE FUNCTION public.ffm_driver_doc_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM fm_driver_doc
    WHERE xmin::text::integer = p_lastupdatestamp   
		and fm_driver_doc_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 T   DROP FUNCTION public.ffm_driver_doc_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210389    ffm_driver_doc_d_all(integer)    FUNCTION     @  CREATE FUNCTION public.ffm_driver_doc_d_all(p_fm_driver_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM fm_driver_doc
    WHERE fm_driver_id = p_fm_driver_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 C   DROP FUNCTION public.ffm_driver_doc_d_all(p_fm_driver_id integer);
       public       postgres    false            �           1255    210343 �   ffm_driver_doc_i(integer, character varying, character varying, character varying, character varying, timestamp without time zone, character varying, character varying)    FUNCTION     !  CREATE FUNCTION public.ffm_driver_doc_i(p_fm_driver_id integer, p_doc_type character varying, p_doc_no character varying, p_doc_file_name character varying, p_doc_path_file character varying, p_expiry_date timestamp without time zone, p_user_input character varying, p_driver_status character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.fm_driver_doc
    (
          fm_driver_id, 
          doc_type, 
          doc_no, 
          doc_file_name, 
          doc_path_file, 
          expiry_date, 
          user_input, 
          user_edit, 
          driver_status
    )
  VALUES (
          p_fm_driver_id,
          p_doc_type,
          p_doc_no,
          p_doc_file_name,
          p_doc_path_file,
          p_expiry_date,
          p_user_input,
          p_user_input,
          p_driver_status
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('fm_driver_doc', 'fm_driver_doc_id'))::integer as row_id;
end;
$$;
 -  DROP FUNCTION public.ffm_driver_doc_i(p_fm_driver_id integer, p_doc_type character varying, p_doc_no character varying, p_doc_file_name character varying, p_doc_path_file character varying, p_expiry_date timestamp without time zone, p_user_input character varying, p_driver_status character varying);
       public       postgres    false            �           1255    210344 �   ffm_driver_doc_u(integer, integer, character varying, character varying, character varying, character varying, timestamp without time zone, integer, character varying, character varying)    FUNCTION     =  CREATE FUNCTION public.ffm_driver_doc_u(p_fm_driver_doc_id integer, p_fm_driver_id integer, p_doc_type character varying, p_doc_no character varying, p_doc_file_name character varying, p_doc_path_file character varying, p_expiry_date timestamp without time zone, p_lastupdatestamp integer, p_user_edit character varying, p_driver_status character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.fm_driver_doc set
               fm_driver_id = p_fm_driver_id,
               doc_type = p_doc_type,
               doc_no = p_doc_no,
               doc_file_name = p_doc_file_name,
               doc_path_file = p_doc_path_file,
               expiry_date = p_expiry_date,
               user_edit = p_user_edit,
               time_edit = now()::timestamp ,
               driver_status = p_driver_status	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND fm_driver_doc_id = p_fm_driver_doc_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 c  DROP FUNCTION public.ffm_driver_doc_u(p_fm_driver_doc_id integer, p_fm_driver_id integer, p_doc_type character varying, p_doc_no character varying, p_doc_file_name character varying, p_doc_path_file character varying, p_expiry_date timestamp without time zone, p_lastupdatestamp integer, p_user_edit character varying, p_driver_status character varying);
       public       postgres    false            �           1255    210380 k   ffm_driver_i(character varying, character varying, character varying, character varying, character varying)    FUNCTION     #  CREATE FUNCTION public.ffm_driver_i(p_driver_name character varying, p_handphone character varying, p_address character varying, p_remarks character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.fm_driver
    (
          driver_name, 
          handphone, 
          address, 
          driver_status,
          remarks,
          user_input, 
          user_edit
    )
  VALUES (
          p_driver_name,
          p_handphone,
          p_address,
          'A',
          p_remarks,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('fm_driver', 'fm_driver_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.ffm_driver_i(p_driver_name character varying, p_handphone character varying, p_address character varying, p_remarks character varying, p_user_input character varying);
       public       postgres    false            �           1255    210382    ffm_driver_s(integer, integer)    FUNCTION     P  CREATE FUNCTION public.ffm_driver_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(fm_driver_id integer, driver_name character varying, handphone character varying, address character varying, driver_status character varying, remarks character varying, dt_doc_type character varying, dt_doc_no character varying, dt_expiry_date timestamp without time zone, dt_doc_file_name character varying, dt_doc_path_file character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.fm_driver_id,
               a.driver_name,
               a.handphone,
               a.address,
               a.driver_status,
               a.remarks,
			   dt.doc_type as dt_doc_type,
               dt.doc_no as dt_doc_no,
               dt.expiry_date as dt_expiry_date,
               dt.doc_file_name as dt_doc_file_name,
               dt.doc_path_file as dt_doc_path_file,               
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.fm_driver_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM fm_driver a 
          LEFT OUTER JOIN fm_driver_doc dt ON a.fm_driver_id = dt.fm_driver_id
          WHERE a.fm_driver_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 P   DROP FUNCTION public.ffm_driver_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210341 }   ffm_driver_u(integer, character varying, character varying, character varying, character varying, integer, character varying)    FUNCTION     6  CREATE FUNCTION public.ffm_driver_u(p_fm_driver_id integer, p_driver_name character varying, p_handphone character varying, p_address character varying, p_driver_status character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.fm_driver set
               driver_name = p_driver_name,
               handphone = p_handphone,
               address = p_address,
               driver_status = p_driver_status,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND fm_driver_id = p_fm_driver_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.ffm_driver_u(p_fm_driver_id integer, p_driver_name character varying, p_handphone character varying, p_address character varying, p_driver_status character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210381 �   ffm_driver_u(integer, character varying, character varying, character varying, character varying, character varying, integer, character varying)    FUNCTION     x  CREATE FUNCTION public.ffm_driver_u(p_fm_driver_id integer, p_driver_name character varying, p_handphone character varying, p_address character varying, p_driver_status character varying, p_remarks character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.fm_driver set
               driver_name = p_driver_name,
               handphone = p_handphone,
               address = p_address,
               driver_status = p_driver_status,
               remarks = p_remarks,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND fm_driver_id = p_fm_driver_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
   DROP FUNCTION public.ffm_driver_u(p_fm_driver_id integer, p_driver_name character varying, p_handphone character varying, p_address character varying, p_driver_status character varying, p_remarks character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210330 &   ffm_fleet_mstr_doc_d(integer, integer)    FUNCTION     �  CREATE FUNCTION public.ffm_fleet_mstr_doc_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM fm_fleet_mstr_doc
    WHERE xmin::text::integer = p_lastupdatestamp   
		and fm_fleet_mstr_doc_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 X   DROP FUNCTION public.ffm_fleet_mstr_doc_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210388 !   ffm_fleet_mstr_doc_d_all(integer)    FUNCTION     T  CREATE FUNCTION public.ffm_fleet_mstr_doc_d_all(p_fm_fleet_mstr_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM fm_fleet_mstr_doc
    WHERE fm_fleet_mstr_id = p_fm_fleet_mstr_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 K   DROP FUNCTION public.ffm_fleet_mstr_doc_d_all(p_fm_fleet_mstr_id integer);
       public       postgres    false            �           1255    210328 �   ffm_fleet_mstr_doc_i(integer, character varying, character varying, character varying, character varying, timestamp without time zone, character varying)    FUNCTION     �  CREATE FUNCTION public.ffm_fleet_mstr_doc_i(p_fm_fleet_mstr_id integer, p_doc_type character varying, p_doc_no character varying, p_doc_file_name character varying, p_doc_path_file character varying, p_expiry_date timestamp without time zone, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.fm_fleet_mstr_doc
    (
          fm_fleet_mstr_id, 
          doc_type, 
          doc_no, 
          doc_file_name, 
          doc_path_file, 
          expiry_date, 
          user_input, 
          user_edit
    )
  VALUES (
          p_fm_fleet_mstr_id,
          p_doc_type,
          p_doc_no,
          p_doc_file_name,
          p_doc_path_file,
          p_expiry_date,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('fm_fleet_mstr_doc', 'fm_fleet_mstr_doc_id'))::integer as row_id;
end;
$$;
   DROP FUNCTION public.ffm_fleet_mstr_doc_i(p_fm_fleet_mstr_id integer, p_doc_type character varying, p_doc_no character varying, p_doc_file_name character varying, p_doc_path_file character varying, p_expiry_date timestamp without time zone, p_user_input character varying);
       public       postgres    false            �           1255    210329 �   ffm_fleet_mstr_doc_u(integer, integer, character varying, character varying, character varying, character varying, timestamp without time zone, integer, character varying)    FUNCTION     	  CREATE FUNCTION public.ffm_fleet_mstr_doc_u(p_fm_fleet_mstr_doc_id integer, p_fm_fleet_mstr_id integer, p_doc_type character varying, p_doc_no character varying, p_doc_file_name character varying, p_doc_path_file character varying, p_expiry_date timestamp without time zone, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.fm_fleet_mstr_doc set
               fm_fleet_mstr_id = p_fm_fleet_mstr_id,
               doc_type = p_doc_type,
               doc_no = p_doc_no,
               doc_file_name = p_doc_file_name,
               doc_path_file = p_doc_path_file,
               expiry_date = p_expiry_date,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND fm_fleet_mstr_doc_id = p_fm_fleet_mstr_doc_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 L  DROP FUNCTION public.ffm_fleet_mstr_doc_u(p_fm_fleet_mstr_doc_id integer, p_fm_fleet_mstr_id integer, p_doc_type character varying, p_doc_no character varying, p_doc_file_name character varying, p_doc_path_file character varying, p_expiry_date timestamp without time zone, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210326 �   ffm_fleet_mstr_i(character varying, integer, integer, integer, character varying, character varying, character varying, timestamp without time zone, character varying)    FUNCTION     p  CREATE FUNCTION public.ffm_fleet_mstr_i(p_license_plate_no character varying, p_fm_fleet_type_id integer, p_fm_driver_id integer, p_fm_driver_id2 integer, p_descs character varying, p_bpkb_no character varying, p_stnk_no character varying, p_stnk_expiry_date timestamp without time zone, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.fm_fleet_mstr
    (
          license_plate_no, 
          fm_fleet_type_id, 
          fm_driver_id, 
          fm_driver_id2, 
          descs, 
          bpkb_no, 
          stnk_no, 
          stnk_expiry_date, 
          user_input, 
          user_edit
    )
  VALUES (
          p_license_plate_no,
          p_fm_fleet_type_id,
          p_fm_driver_id,
          p_fm_driver_id2,
          p_descs,
          p_bpkb_no,
          p_stnk_no,
          p_stnk_expiry_date,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('fm_fleet_mstr', 'fm_fleet_mstr_id'))::integer as row_id;
end;
$$;
 ?  DROP FUNCTION public.ffm_fleet_mstr_i(p_license_plate_no character varying, p_fm_fleet_type_id integer, p_fm_driver_id integer, p_fm_driver_id2 integer, p_descs character varying, p_bpkb_no character varying, p_stnk_no character varying, p_stnk_expiry_date timestamp without time zone, p_user_input character varying);
       public       postgres    false            �           1255    210325 "   ffm_fleet_mstr_s(integer, integer)    FUNCTION     >	  CREATE FUNCTION public.ffm_fleet_mstr_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(fm_fleet_mstr_id integer, license_plate_no character varying, fm_fleet_type_id integer, fleet_type_descs character varying, fm_driver_id integer, driver1 character varying, fm_driver_id2 integer, driver2 character varying, descs character varying, bpkb_no character varying, stnk_no character varying, stnk_expiry_date timestamp without time zone, dt_doc_type character varying, dt_doc_no character varying, dt_expiry_date timestamp without time zone, dt_doc_file_name character varying, dt_doc_path_file character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer, lastupdatestamp_d integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.fm_fleet_mstr_id,
               a.license_plate_no,
               a.fm_fleet_type_id,
               b.descs as fleet_type_descs,
               a.fm_driver_id,
               c.driver_name as driver1,
               a.fm_driver_id2,
               d.driver_name as driver2,
               a.descs,
               a.bpkb_no,
               a.stnk_no,
               a.stnk_expiry_date,
               dt.doc_type as dt_doc_type,
               dt.doc_no as dt_doc_no,
               dt.expiry_date as dt_expiry_date,
               dt.doc_file_name as dt_doc_file_name,
               dt.doc_path_file as dt_doc_path_file,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.fm_fleet_mstr_id as row_id,
               a.xmin::text::integer as lastupdatestamp,
               dt.xmin::text::integer as lastupdatestamp_d 
          FROM fm_fleet_mstr a 
          JOIN fm_fleet_type b ON a.fm_fleet_type_id = b.fm_fleet_type_id
          LEFT OUTER JOIN fm_driver c ON a.fm_driver_id = c.fm_driver_id
          LEFT OUTER JOIN fm_driver d ON a.fm_driver_id = d.fm_driver_id
          LEFT OUTER JOIN fm_fleet_mstr_doc dt ON a.fm_fleet_mstr_id = dt.fm_fleet_mstr_id
          WHERE a.fm_fleet_mstr_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 T   DROP FUNCTION public.ffm_fleet_mstr_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210327 �   ffm_fleet_mstr_u(integer, character varying, integer, integer, integer, character varying, character varying, character varying, timestamp without time zone, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.ffm_fleet_mstr_u(p_fm_fleet_mstr_id integer, p_license_plate_no character varying, p_fm_fleet_type_id integer, p_fm_driver_id integer, p_fm_driver_id2 integer, p_descs character varying, p_bpkb_no character varying, p_stnk_no character varying, p_stnk_expiry_date timestamp without time zone, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.fm_fleet_mstr set
               license_plate_no = p_license_plate_no,
               fm_fleet_type_id = p_fm_fleet_type_id,
               fm_driver_id = p_fm_driver_id,
               fm_driver_id2 = p_fm_driver_id2,
               descs = p_descs,
               bpkb_no = p_bpkb_no,
               stnk_no = p_stnk_no,
               stnk_expiry_date = p_stnk_expiry_date,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND fm_fleet_mstr_id = p_fm_fleet_mstr_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 u  DROP FUNCTION public.ffm_fleet_mstr_u(p_fm_fleet_mstr_id integer, p_license_plate_no character varying, p_fm_fleet_type_id integer, p_fm_driver_id integer, p_fm_driver_id2 integer, p_descs character varying, p_bpkb_no character varying, p_stnk_no character varying, p_stnk_expiry_date timestamp without time zone, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210271 "   ffm_fleet_type_d(integer, integer)    FUNCTION     �  CREATE FUNCTION public.ffm_fleet_type_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM fm_fleet_type
    WHERE xmin::text::integer = p_lastupdatestamp   
		and fm_fleet_type_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 T   DROP FUNCTION public.ffm_fleet_type_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210269 o   ffm_fleet_type_i(character varying, character varying, character varying, character varying, character varying)    FUNCTION       CREATE FUNCTION public.ffm_fleet_type_i(p_fleet_cd character varying, p_descs character varying, p_file_name character varying, p_path_file character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.fm_fleet_type
    (
          fleet_cd, 
          descs, 
          file_name, 
          path_file, 
          user_input, 
          user_edit
    )
  VALUES (
          p_fleet_cd,
          p_descs,
          p_file_name,
          p_path_file,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('fm_fleet_type', 'fm_fleet_type_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.ffm_fleet_type_i(p_fleet_cd character varying, p_descs character varying, p_file_name character varying, p_path_file character varying, p_user_input character varying);
       public       postgres    false            �           1255    210272 "   ffm_fleet_type_s(integer, integer)    FUNCTION     (  CREATE FUNCTION public.ffm_fleet_type_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(fm_fleet_type_id integer, fleet_cd character varying, descs character varying, file_name character varying, path_file character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.fm_fleet_type_id,
               a.fleet_cd,
               a.descs,
               a.file_name,
               a.path_file,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.fm_fleet_type_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM fm_fleet_type a 
          WHERE a.fm_fleet_type_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 T   DROP FUNCTION public.ffm_fleet_type_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210270 �   ffm_fleet_type_u(integer, character varying, character varying, character varying, character varying, integer, character varying)    FUNCTION     /  CREATE FUNCTION public.ffm_fleet_type_u(p_fm_fleet_type_id integer, p_fleet_cd character varying, p_descs character varying, p_file_name character varying, p_path_file character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.fm_fleet_type set
               fleet_cd = p_fleet_cd,
               descs = p_descs,
               file_name = p_file_name,
               path_file = p_path_file,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND fm_fleet_type_id = p_fm_fleet_type_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.ffm_fleet_type_u(p_fm_fleet_type_id integer, p_fleet_cd character varying, p_descs character varying, p_file_name character varying, p_path_file character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210180    fibonacci(integer)    FUNCTION     �  CREATE FUNCTION public.fibonacci(n integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ 
DECLARE
   counter INTEGER := 0 ; 
   i INTEGER := 0 ; 
   j INTEGER := 1 ;
   _resutl varchar :='';
BEGIN

	IF (n < 1) THEN
		RETURN 0 ;
	END IF; 
	
	LOOP 
		EXIT WHEN counter = n ; 
		counter := counter + 1 ; 
		SELECT j, i + j INTO i,	j ;
        _resutl := _resutl||'X';
	END LOOP ; 
	
	RETURN _resutl ;
END ; 
$$;
 +   DROP FUNCTION public.fibonacci(n integer);
       public       postgres    false                       1255    210934   fmk_appointment_action_u(integer, integer, integer, integer, character, character varying, character varying, timestamp without time zone, character, character, timestamp without time zone, character varying, character varying, integer, character, character varying, integer)    FUNCTION     	  CREATE FUNCTION public.fmk_appointment_action_u(p_mk_appointment_id integer, p_ss_portfolio_id integer, p_cm_contact_id integer, p_cm_contact_person_id integer, p_action_type character, p_meeting_address character varying, p_descs character varying, p_appointment_date timestamp without time zone, p_appointment_type character, p_next_action_type character, p_next_appointment_date timestamp without time zone, p_next_meeting_address character varying, p_next_descs character varying, p_next_cm_contact_person_id integer, p_status character, p_user_input character varying, p_lastupdatestamp integer) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         PERFORM public.fmk_logbook_i(p_ss_portfolio_id,p_cm_contact_id,p_cm_contact_person_id,
         							 p_appointment_date,now()::TIMESTAMP WITHOUT TIME ZONE,p_action_type,
                                     p_meeting_address,p_descs,p_user_input);
                                     
                                     
		update public.mk_appointment
        	set status ='L'
        WHERE xmin::text::integer = p_lastupdatestamp
        AND mk_appointment_id = p_mk_appointment_id;
         
        IF COALESCE(p_next_action_type,'') <>'' THEN
          INSERT INTO 
                public.mk_appointment
              (
                cm_contact_id,        ss_portfolio_id,		action_type,
                pic,              	appointment_date,       meeting_address,
                descs,              	user_input,             user_edit,
                status,              	cm_contact_person_id,   appointment_type
              )
              VALUES (
                p_cm_contact_id,      p_ss_portfolio_id,      p_action_type,
                '',                	p_next_appointment_date,p_next_meeting_address,
                p_next_descs,			p_user_input,			p_user_input,            
                p_status,             p_next_cm_contact_person_id, p_appointment_type
              );
          
          RETURN QUERY
          SELECT currval(pg_get_serial_sequence('mk_appointment', 'mk_appointment_id'))::integer as row_id;
        else
        	          RETURN QUERY
                      select p_mk_appointment_id as row_id;
        END IF;
         
end;
$$;
 X  DROP FUNCTION public.fmk_appointment_action_u(p_mk_appointment_id integer, p_ss_portfolio_id integer, p_cm_contact_id integer, p_cm_contact_person_id integer, p_action_type character, p_meeting_address character varying, p_descs character varying, p_appointment_date timestamp without time zone, p_appointment_type character, p_next_action_type character, p_next_appointment_date timestamp without time zone, p_next_meeting_address character varying, p_next_descs character varying, p_next_cm_contact_person_id integer, p_status character, p_user_input character varying, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209611 #   fmk_appointment_d(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fmk_appointment_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM mk_appointment
    WHERE xmin::text::integer = p_lastupdatestamp   
		and mk_appointment_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 U   DROP FUNCTION public.fmk_appointment_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210531 �   fmk_appointment_i(integer, integer, character, timestamp without time zone, character varying, character varying, integer, character, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_appointment_i(p_cm_contact_id integer, p_ss_portfolio_id integer, p_action_type character, p_appointment_date timestamp without time zone, p_meeting_address character varying, p_descs character varying, p_cm_contact_person_id integer, p_appointment_type character, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.mk_appointment
    (
          cm_contact_id,
          ss_portfolio_id, 
          action_type, 
          pic, 
          cm_contact_person_id,
          appointment_date, 
          meeting_address, 
          descs, 
          appointment_type,
          user_input, 
          user_edit
    )
  VALUES (
          p_cm_contact_id,
          p_ss_portfolio_id,
          p_action_type,
          '',
          p_cm_contact_person_id,
          p_appointment_date,
          p_meeting_address,
          p_descs,
          p_appointment_type,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('mk_appointment', 'mk_appointment_id'))::integer as row_id;
end;
$$;
 C  DROP FUNCTION public.fmk_appointment_i(p_cm_contact_id integer, p_ss_portfolio_id integer, p_action_type character, p_appointment_date timestamp without time zone, p_meeting_address character varying, p_descs character varying, p_cm_contact_person_id integer, p_appointment_type character, p_user_input character varying);
       public       postgres    false            �           1255    209764 #   fmk_appointment_s(integer, integer)    FUNCTION       CREATE FUNCTION public.fmk_appointment_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(cm_contact_id integer, name character varying, phone_no character varying, address character varying, country character varying, province character varying, city character varying, district character varying, email character varying, website character varying, action_type character, pic character varying, appointment_date timestamp without time zone, meeting_address character varying, descs character varying, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT
               a.cm_contact_id,
               b.name,
               b.phone_no,
               b.address, scr.descs as country, spr.descs as province, sct.descs as city, sdt.descs as district,
               b.email, b.website,
               a.action_type,
               a.pic,
               a.appointment_date,
               a.meeting_address,
               a.descs,
               a.mk_appointment_id as row_id,
               a.xmin::text::integer as lastupdatestamp
          FROM mk_appointment a left join cm_contact b on a.cm_contact_id = b.cm_contact_id
          left join ss_country scr on scr.ss_country_id = b.ss_country_id
          left join ss_province spr on spr.ss_country_id = b.ss_country_id and spr.ss_province_id = b.ss_province_id
          left join ss_city sct on sct.ss_province_id = b.ss_province_id and sct.ss_city_id = b.ss_city_id
          left join ss_district sdt on sdt.ss_city_id = b.ss_city_id and sdt.ss_district_id = b.ss_district_id
          WHERE a.mk_appointment_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 U   DROP FUNCTION public.fmk_appointment_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209770 (   fmk_appointment_s_todo(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fmk_appointment_s_todo(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(name character varying, address character varying, country character varying, province character varying, city character varying, district character varying, phone_no character varying, email character varying, website character varying, contact_person character varying, contact_phone_no character varying, action_type character, pic character varying, descs character varying, next_action_type character, next_appointment_date timestamp without time zone, next_meeting_address character varying, next_descs character varying, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
  RETURN QUERY  
  SELECT b.name,b.address,
  scr.descs as country, spr.descs as province, sct.descs as city, sdt.descs as district,
  b.phone_no,b.email,b.website,b.contact_person,b.contact_phone_no,
  a.action_type,a.pic,a.descs,a.next_action_type,a.next_appointment_date,a.next_meeting_address,a.next_descs,
  a.xmin::text::integer as lastupdatestamp,a.mk_appointment_id as row_id
  from mk_appointment a
  inner join cm_contact b ON a.cm_contact_id = b.cm_contact_id
  left join ss_country scr on scr.ss_country_id = b.ss_country_id
          left join ss_province spr on spr.ss_country_id = b.ss_country_id and spr.ss_province_id = b.ss_province_id
          left join ss_city sct on sct.ss_province_id = b.ss_province_id and sct.ss_city_id = b.ss_city_id
          left join ss_district sdt on sdt.ss_city_id = b.ss_city_id and sdt.ss_district_id = b.ss_district_id
  where a.mk_appointment_id = p_row_id --3
  and a.xmin::text::integer = p_lastupdatestamp--66693;
;
END;
$$;
 Z   DROP FUNCTION public.fmk_appointment_s_todo(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210933 +   fmk_appointment_s_todo_v2(integer, integer)    FUNCTION     �	  CREATE FUNCTION public.fmk_appointment_s_todo_v2(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(name character varying, address character varying, country character varying, province character varying, city character varying, district character varying, phone_no character varying, email character varying, website character varying, action_type character, cm_contact_person_id integer, contact_person_name character varying, contact_phone_no character varying, contact_email character varying, contact_position character varying, descs character varying, appointment_date timestamp without time zone, appointment_type character, status character, last_action_date timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
  RETURN QUERY  
  		SELECT 	b.name,					b.address,  		scr.descs as country, 
        		spr.descs as province, 	sct.descs as city, 	sdt.descs as district,
                b.phone_no,				b.email,			b.website,
                a.action_type,
                a.cm_contact_person_id,	x.name as contact_person_name,		
                x.phone_no as contact_phone_no,				
                x.email as contact_email,			
                x."position" as contact_position,	
                a.descs,			a.appointment_date,
                a.appointment_type,      a.status,			
                (
                SELECT max(m.logbook_date) AS last_action_date
                FROM mk_logbook m
                WHERE m.ss_portfolio_id = a.ss_portfolio_id 
                AND m.cm_contact_id = a.cm_contact_id
                AND m.action_type = a.action_type
                ) AS last_action_date,  
                a.mk_appointment_id as row_id,            
                a.xmin::text::integer as lastupdatestamp                
  from mk_appointment a
  inner join cm_contact b ON a.cm_contact_id = b.cm_contact_id
  left join cm_contact_person x on x.cm_contact_person_id = a.cm_contact_person_id
  left join ss_country scr on scr.ss_country_id = b.ss_country_id
          left join ss_province spr on spr.ss_country_id = b.ss_country_id and spr.ss_province_id = b.ss_province_id
          left join ss_city sct on sct.ss_province_id = b.ss_province_id and sct.ss_city_id = b.ss_city_id
          left join ss_district sdt on sdt.ss_city_id = b.ss_city_id and sdt.ss_district_id = b.ss_district_id
  where a.mk_appointment_id = p_row_id --3
  and a.xmin::text::integer = p_lastupdatestamp--66693;
;
END;
$$;
 ]   DROP FUNCTION public.fmk_appointment_s_todo_v2(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209739 �   fmk_appointment_u(integer, integer, integer, character, character varying, character varying, character, timestamp without time zone, character varying, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_appointment_u(p_mk_appointment_id integer, p_cm_contact_id integer, p_ss_portfolio_id integer, p_action_type character, p_pic character varying, p_descs character varying, p_next_action_type character, p_next_appointment_date timestamp without time zone, p_next_meeting_address character varying, p_next_descs character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.mk_appointment set
               cm_contact_id = p_cm_contact_id,
               ss_portfolio_id = p_ss_portfolio_id,
               action_type = p_action_type,
               pic = p_pic,
               descs = p_descs,     
               next_action_type = p_next_action_type,       
               next_appointment_date = p_next_appointment_date,
               next_meeting_address = p_next_meeting_address,
			   next_descs = p_next_descs,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND mk_appointment_id = p_mk_appointment_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �  DROP FUNCTION public.fmk_appointment_u(p_mk_appointment_id integer, p_cm_contact_id integer, p_ss_portfolio_id integer, p_action_type character, p_pic character varying, p_descs character varying, p_next_action_type character, p_next_appointment_date timestamp without time zone, p_next_meeting_address character varying, p_next_descs character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false                       1255    211039 .   fmk_commision_dash(integer, character varying)    FUNCTION       CREATE FUNCTION public.fmk_commision_dash(p_ss_portfolio_id integer, p_user_id character varying) RETURNS TABLE(paid_amt numeric, overdue_amt numeric, pending_amt numeric)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.paid_amt,
               a.overdue_amt,
               a.pending_amt
          FROM mk_commision_dash a 
          WHERE a.ss_portfolio_id = p_ss_portfolio_id
          AND a.user_id = p_user_id
;
	 	  
END;
$$;
 a   DROP FUNCTION public.fmk_commision_dash(p_ss_portfolio_id integer, p_user_id character varying);
       public       postgres    false            	           1255    211040 1   fmk_commision_dash_dt(integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_commision_dash_dt(p_ss_portfolio_id integer, p_user_id character varying) RETURNS TABLE(marketing_id character varying, marketing_name character varying, paid_amt numeric, overdue_amt numeric, pending_amt numeric)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.marketing_id,
               a.marketing_name,
               a.paid_amt,
               a.overdue_amt,
               a.pending_amt
          FROM mk_commision_dash_dt a 
          WHERE a.ss_portfolio_id = p_ss_portfolio_id
          AND a.user_id = p_user_id
;
	 	  
END;
$$;
 d   DROP FUNCTION public.fmk_commision_dash_dt(p_ss_portfolio_id integer, p_user_id character varying);
       public       postgres    false            �           1255    210691 0   fmk_get_marketing_target_year(character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_get_marketing_target_year(p_user_id character varying) RETURNS TABLE(years integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
		SELECT DISTINCT b.years
          FROM mk_marketing_team a 
          INNER JOIN mk_marketing_target b
          ON a.child_marketing_id = b.marketing_id          
          WHERE a.user_id = p_user_id  
          ORDER BY years DESC
;
	 	  
END;
$$;
 Q   DROP FUNCTION public.fmk_get_marketing_target_year(p_user_id character varying);
       public       postgres    false            �           1255    210690 )   fmk_get_marketing_team(character varying)    FUNCTION     %  CREATE FUNCTION public.fmk_get_marketing_team(p_user_id character varying) RETURNS TABLE(marketing_id character varying, marketing_name character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
		SELECT 
               a.child_marketing_id as marketing_id,
               b.name as marketing_name
          FROM mk_marketing_team a 
          INNER JOIN mk_marketing b
          ON a.child_marketing_id = b.marketing_id
          WHERE a.user_id = p_user_id  
;
	 	  
END;
$$;
 J   DROP FUNCTION public.fmk_get_marketing_team(p_user_id character varying);
       public       postgres    false            g           1255    210504    fmk_logbook_d(integer, integer)    FUNCTION     x  CREATE FUNCTION public.fmk_logbook_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM mk_logbook
    WHERE xmin::text::integer = p_lastupdatestamp   
		and mk_logbook_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 Q   DROP FUNCTION public.fmk_logbook_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210502 �   fmk_logbook_i(integer, integer, integer, timestamp without time zone, timestamp without time zone, character, character varying, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_logbook_i(p_ss_portfolio_id integer, p_cm_contact_id integer, p_cm_contact_person_id integer, p_appoinment_date timestamp without time zone, p_logbook_date timestamp without time zone, p_action_type character, p_meeting_address character varying, p_descs character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.mk_logbook
    (
          ss_portfolio_id, 
          cm_contact_id, 
          cm_contact_person_id, 
          appoinment_date, 
          logbook_date, 
          action_type, 
          meeting_address, 
          descs, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_portfolio_id,
          p_cm_contact_id,
          p_cm_contact_person_id,
          p_appoinment_date,
          p_logbook_date,
          p_action_type,
          p_meeting_address,
          p_descs,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('mk_logbook', 'mk_logbook_id'))::integer as row_id;
end;
$$;
 L  DROP FUNCTION public.fmk_logbook_i(p_ss_portfolio_id integer, p_cm_contact_id integer, p_cm_contact_person_id integer, p_appoinment_date timestamp without time zone, p_logbook_date timestamp without time zone, p_action_type character, p_meeting_address character varying, p_descs character varying, p_user_input character varying);
       public       postgres    false            �           1255    210505    fmk_logbook_s(integer, integer)    FUNCTION     :  CREATE FUNCTION public.fmk_logbook_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(mk_logbook_id integer, ss_portfolio_id integer, cm_contact_id integer, cm_contact_person_id integer, appoinment_date timestamp without time zone, logbook_date timestamp without time zone, action_type character, meeting_address character varying, descs character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.mk_logbook_id,
               a.ss_portfolio_id,
               a.cm_contact_id,
               a.cm_contact_person_id,
               a.appoinment_date,
               a.logbook_date,
               a.action_type,
               a.meeting_address,
               a.descs,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.mk_logbook_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM mk_logbook a 
          WHERE a.mk_logbook_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 Q   DROP FUNCTION public.fmk_logbook_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210503 �   fmk_logbook_u(integer, integer, integer, integer, timestamp without time zone, timestamp without time zone, character, character varying, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_logbook_u(p_mk_logbook_id integer, p_ss_portfolio_id integer, p_cm_contact_id integer, p_cm_contact_person_id integer, p_appoinment_date timestamp without time zone, p_logbook_date timestamp without time zone, p_action_type character, p_meeting_address character varying, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.mk_logbook set
               ss_portfolio_id = p_ss_portfolio_id,
               cm_contact_id = p_cm_contact_id,
               cm_contact_person_id = p_cm_contact_person_id,
               appoinment_date = p_appoinment_date,
               logbook_date = p_logbook_date,
               action_type = p_action_type,
               meeting_address = p_meeting_address,
               descs = p_descs,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND mk_logbook_id = p_mk_logbook_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
   DROP FUNCTION public.fmk_logbook_u(p_mk_logbook_id integer, p_ss_portfolio_id integer, p_cm_contact_id integer, p_cm_contact_person_id integer, p_appoinment_date timestamp without time zone, p_logbook_date timestamp without time zone, p_action_type character, p_meeting_address character varying, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210721 Y   fmk_marketing_customer_u(integer, integer, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_marketing_customer_u(p_row_id integer, p_ss_portfolio_id integer, p_marketing_id character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;v_count_person integer=0;v_contact_person varchar(60)='';

begin	

         
        UPDATE  public.cm_contact set
               marketing_id = p_marketing_id,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND cm_contact_id = p_row_id;    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fmk_marketing_customer_u(p_row_id integer, p_ss_portfolio_id integer, p_marketing_id character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210594 !   fmk_marketing_d(integer, integer)    FUNCTION     ~  CREATE FUNCTION public.fmk_marketing_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM mk_marketing
    WHERE xmin::text::integer = p_lastupdatestamp   
		and mk_marketing_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 S   DROP FUNCTION public.fmk_marketing_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210592 �   fmk_marketing_i(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, boolean, timestamp without time zone, integer, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_marketing_i(p_ss_portfolio_id integer, p_user_id character varying, p_marketing_id character varying, p_name character varying, p_nik_id character varying, p_address character varying, p_email character varying, p_hand_phone character varying, p_status_active boolean, p_join_date timestamp without time zone, p_monthly_point integer, p_monthly_new_prospect integer, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.mk_marketing
    (
          ss_portfolio_id, 
          user_id, 
          marketing_id, 
          name, 
          nik_id, 
          address, 
          email, 
          hand_phone, 
          status_active, 
          join_date, 
          monthly_point, 
          monthly_new_prospect, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_portfolio_id,
          p_user_id,
          p_marketing_id,
          p_name,
          p_nik_id,
          p_address,
          p_email,
          p_hand_phone,
          p_status_active,
          p_join_date,
          p_monthly_point,
          p_monthly_new_prospect,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('mk_marketing', 'mk_marketing_id'))::integer as row_id;
end;
$$;
 �  DROP FUNCTION public.fmk_marketing_i(p_ss_portfolio_id integer, p_user_id character varying, p_marketing_id character varying, p_name character varying, p_nik_id character varying, p_address character varying, p_email character varying, p_hand_phone character varying, p_status_active boolean, p_join_date timestamp without time zone, p_monthly_point integer, p_monthly_new_prospect integer, p_user_input character varying);
       public       postgres    false            �           1255    210595 !   fmk_marketing_s(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fmk_marketing_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(mk_marketing_id integer, ss_portfolio_id integer, user_id character varying, marketing_id character varying, name character varying, nik_id character varying, address character varying, email character varying, hand_phone character varying, status_active boolean, join_date timestamp without time zone, monthly_point integer, monthly_new_prospect integer, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.mk_marketing_id,
               a.ss_portfolio_id,
               a.user_id,
               a.marketing_id,
               a.name,
               a.nik_id,
               a.address,
               a.email,
               a.hand_phone,
               a.status_active,
               a.join_date,
               a.monthly_point,
               a.monthly_new_prospect,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.mk_marketing_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM mk_marketing a 
          WHERE a.mk_marketing_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 S   DROP FUNCTION public.fmk_marketing_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210688 G   fmk_marketing_target_add(character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_marketing_target_add(p_marketing_id character varying, p_years integer, p_user_input character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
declare v_cnt integer;
declare counter integer;
begin

SELECT COUNT(*) into v_cnt
FROM mk_marketing_target m
WHERE m.marketing_id = p_marketing_id
and m.years = p_years;

IF v_cnt IS NULL or v_cnt = 0 THEN

    FOR counter IN 1..12 LOOP
                PERFORM public.fmk_marketing_target_i(p_marketing_id,	p_years,	counter,
                                                        0,	0,	0,	0, p_user_input);
       END LOOP;
END IF;       
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fmk_marketing_target_add(p_marketing_id character varying, p_years integer, p_user_input character varying);
       public       postgres    false            �           1255    210710 2   fmk_marketing_target_d(character varying, integer)    FUNCTION     }  CREATE FUNCTION public.fmk_marketing_target_d(p_marketing_id character varying, p_years integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM mk_marketing_target
    WHERE marketing_id = p_marketing_id 
    AND years = p_years;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 `   DROP FUNCTION public.fmk_marketing_target_d(p_marketing_id character varying, p_years integer);
       public       postgres    false            �           1255    210873 5   fmk_marketing_target_dash(integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_marketing_target_dash(p_ss_portfolio_id integer, p_user_id character varying) RETURNS TABLE(years integer, months integer, target_amt numeric, achievement_amt numeric, display_target_amt numeric, display_achievement_amt numeric, display_satuan character varying)
    LANGUAGE plpgsql
    AS $$
declare v_count integer; 
		v_years integer; 
        v_months integer; 
        counter integer;
        v_target_amt NUMERIC(20,4); 
        v_achievement_amt NUMERIC(20,4); 
        v_disp_target_amt NUMERIC(20,4); 
        v_disp_achievement_amt NUMERIC(20,4); 
        v_disp_satuan varchar(10);        
        v_date timestamp WITHOUT time zone;
		data_loop RECORD;
begin	

	v_date := now()::timestamp WITHOUT time zone;
    SELECT EXTRACT(YEAR FROM v_date) into v_years;
    SELECT EXTRACT(MONTH FROM v_date) into v_months;
    
    
    /*Delete mk_marketing_target_dash*/
    DELETE FROM mk_marketing_target_dash
    WHERE ss_portfolio_id = p_ss_portfolio_id 
    AND user_input = p_user_id;
    
    FOR counter IN 1..12 LOOP
    	select sum(CASE WHEN ftl_amt IS NULL THEN 0 ELSE ftl_amt END + 
        CASE WHEN ltl_amt IS NULL THEN 0 ELSE ltl_amt END + 
        CASE WHEN project_amt IS NULL THEN 0 ELSE project_amt END + 
        CASE WHEN rental_amt IS NULL THEN 0 ELSE rental_amt END) into v_target_amt
        from mk_marketing_target a
        INNER JOIN mk_marketing_team b 
        ON a.marketing_id = b.child_marketing_id
        WHERE b.ss_portfolio_id =  p_ss_portfolio_id
        AND b.user_id = p_user_id
        AND a.years = v_years
        AND a.month = counter;
        
        IF counter <= v_months THEN 
        	v_achievement_amt := 10000000;
        ELSE
        	v_achievement_amt := 0;
        END IF;    
        
        IF v_target_amt > 2000000000 THEN
        	v_disp_satuan := 'M';
            v_disp_target_amt := v_target_amt/1000000000;
            v_disp_achievement_amt :=  v_achievement_amt/1000000000;
        ELSE 
        	v_disp_satuan = 'JT';
            v_disp_target_amt := v_target_amt/1000000;
            v_disp_achievement_amt :=  v_achievement_amt/1000000;            
        END IF;  
        
    	INSERT INTO 
        public.mk_marketing_target_dash
          (
                ss_portfolio_id,
                user_id,
                years,
                months, 
                target_amt, 
                achievement_amt,
                display_target_amt,
                display_achievement_amt,
                display_satuan,
                user_input,
                user_edit
          )
        VALUES (
                p_ss_portfolio_id,
                p_user_id,
                v_years,
                counter,
                v_target_amt,
                v_achievement_amt,
                v_disp_target_amt,
                v_disp_achievement_amt,
                v_disp_satuan,
                p_user_id,
                p_user_id
        );              
    
    END LOOP;
    
    RETURN QUERY                
  	SELECT 
          a.years,
          a.months, 
          a.target_amt, 
          a.achievement_amt,
          a.display_target_amt,
          a.display_achievement_amt,
          a.display_satuan
    FROM mk_marketing_target_dash a 
    WHERE a.ss_portfolio_id = p_ss_portfolio_id 
    AND a.user_id = p_user_id;
	  

end;
$$;
 h   DROP FUNCTION public.fmk_marketing_target_dash(p_ss_portfolio_id integer, p_user_id character varying);
       public       postgres    false            �           1255    210876 8   fmk_marketing_target_dash_dt(integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_marketing_target_dash_dt(p_ss_portfolio_id integer, p_user_id character varying) RETURNS TABLE(marketing_id character varying, marketing_name character varying, years integer, months integer, target_amt numeric, achievement_amt numeric, display_target_amt numeric, display_achievement_amt numeric, display_satuan character varying)
    LANGUAGE plpgsql
    AS $$
declare v_count integer; 
		v_years integer; 
        v_months integer; 
        counter integer;
        v_marketing_id varchar;
        v_marketing_name varchar;
        v_target_amt NUMERIC(20,4); 
        v_achievement_amt NUMERIC(20,4); 
        v_disp_target_amt NUMERIC(20,4); 
        v_disp_achievement_amt NUMERIC(20,4); 
        v_disp_satuan varchar(10);        
        v_date timestamp WITHOUT time zone;
		data_loop RECORD;
begin	

	v_date := now()::timestamp WITHOUT time zone;
    SELECT EXTRACT(YEAR FROM v_date) into v_years;
    SELECT EXTRACT(MONTH FROM v_date) into v_months;
    
    
    /*Delete mk_marketing_target_dash*/
    DELETE FROM mk_marketing_target_dash_dt
    WHERE ss_portfolio_id = p_ss_portfolio_id 
    AND user_input = p_user_id;
    
    FOR counter IN 1..12 LOOP
    
    	FOR data_loop IN
          select b.child_marketing_id as marketing_id,
          c.name as marketing_name,
          SUM(CASE WHEN ftl_amt IS NULL THEN 0 ELSE ftl_amt END + 
          CASE WHEN ltl_amt IS NULL THEN 0 ELSE ltl_amt END + 
          CASE WHEN project_amt IS NULL THEN 0 ELSE project_amt END + 
          CASE WHEN rental_amt IS NULL THEN 0 ELSE rental_amt END) as target_amt
          from mk_marketing_target a        
          INNER JOIN mk_marketing_team b 
          ON a.marketing_id = b.child_marketing_id
          INNER JOIN mk_marketing c
          ON b.child_marketing_id = c.marketing_id
          WHERE b.ss_portfolio_id =  p_ss_portfolio_id
          AND b.user_id = p_user_id
          AND a.years = v_years
          AND a.month = counter
          GROUP BY b.child_marketing_id, c.name
          ORDER BY b.child_marketing_id, c.name
        LOOP  
        
        	v_target_amt := data_loop.target_amt;
            
            IF counter <= v_months THEN 
                v_achievement_amt := 10000000;
            ELSE
                v_achievement_amt := 0;
            END IF;    
        
            IF v_target_amt > 2000000000 THEN
                v_disp_satuan := 'M';
                v_disp_target_amt := v_target_amt/1000000000;
                v_disp_achievement_amt :=  v_achievement_amt/1000000000;
            ELSE 
                v_disp_satuan = 'JT';
                v_disp_target_amt := v_target_amt/1000000;
                v_disp_achievement_amt :=  v_achievement_amt/1000000;            
            END IF;  
        
            INSERT INTO 
            public.mk_marketing_target_dash_dt
              (
                    ss_portfolio_id,
                    user_id,
                    marketing_id,
                    marketing_name,
                    years,
                    months, 
                    target_amt, 
                    achievement_amt,
                    display_target_amt,
                    display_achievement_amt,
                    display_satuan,
                    user_input,
                    user_edit
              )
            VALUES (
                    p_ss_portfolio_id,
                    p_user_id,
                    data_loop.marketing_id,
                    data_loop.marketing_name,                    
                    v_years,
                    counter,
                    v_target_amt,
                    v_achievement_amt,
                    v_disp_target_amt,
                    v_disp_achievement_amt,
                    v_disp_satuan,
                    p_user_id,
                    p_user_id
            );     
        END LOOP;             
    
    END LOOP;
    
    RETURN QUERY                
  	SELECT a.marketing_id,
    	  a.marketing_name,	
          a.years,
          a.months, 
          a.target_amt, 
          a.achievement_amt,
          a.display_target_amt,
          a.display_achievement_amt,
          a.display_satuan
    FROM mk_marketing_target_dash_dt a 
    WHERE a.ss_portfolio_id = p_ss_portfolio_id 
    AND a.user_id = p_user_id
    ORDER BY a.marketing_id, a.years, a.months;
	  

end;
$$;
 k   DROP FUNCTION public.fmk_marketing_target_dash_dt(p_ss_portfolio_id integer, p_user_id character varying);
       public       postgres    false            �           1255    210652 r   fmk_marketing_target_i(character varying, integer, integer, numeric, numeric, numeric, numeric, character varying)    FUNCTION     =  CREATE FUNCTION public.fmk_marketing_target_i(p_marketing_id character varying, p_years integer, p_month integer, p_ftl_amt numeric, p_ltl_amt numeric, p_project_amt numeric, p_rental_amt numeric, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

	DELETE FROM mk_marketing_target
    WHERE marketing_id = p_marketing_id 
    AND years = p_years
    AND month = p_month;

  		INSERT INTO 
  public.mk_marketing_target
    (
		  marketing_id,
          years, 
          month, 
          ftl_amt, 
          ltl_amt, 
          project_amt, 
          rental_amt, 
          user_input,
          user_edit
    )
  VALUES (
          p_marketing_id,
          p_years,
          p_month,
          p_ftl_amt,
          p_ltl_amt,
          p_project_amt,
          p_rental_amt,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('mk_marketing_target', 'mk_marketing_target_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fmk_marketing_target_i(p_marketing_id character varying, p_years integer, p_month integer, p_ftl_amt numeric, p_ltl_amt numeric, p_project_amt numeric, p_rental_amt numeric, p_user_input character varying);
       public       postgres    false            �           1255    210708 2   fmk_marketing_target_s(character varying, integer)    FUNCTION     f  CREATE FUNCTION public.fmk_marketing_target_s(p_marketing_id character varying, p_year integer) RETURNS TABLE(mk_marketing_target_id integer, marketing_id character varying, years integer, month integer, ftl_amt numeric, ltl_amt numeric, project_amt numeric, rental_amt numeric, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.mk_marketing_target_id,
               a.marketing_id,
               a.years,
               a.month,
               a.ftl_amt,
               a.ltl_amt,
               a.project_amt,
               a.rental_amt,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.mk_marketing_target_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM mk_marketing_target a 
          WHERE a.marketing_id = p_marketing_id 
          AND a.years = p_year
;
	 	  
END;
$$;
 _   DROP FUNCTION public.fmk_marketing_target_s(p_marketing_id character varying, p_year integer);
       public       postgres    false            �           1255    210640 {   fmk_marketing_target_u(integer, character varying, integer, integer, numeric, numeric, numeric, numeric, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_marketing_target_u(p_mk_marketing_team_id integer, p_marketing_id character varying, p_years integer, p_month integer, p_ftl_amt numeric, p_ltl_amt numeric, p_project_amt numeric, p_rental_amt numeric, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.mk_marketing_target set
               years = p_years,
               month = p_month,
               ftl_amt = p_ftl_amt,
               ltl_amt = p_ltl_amt,
               project_amt = p_project_amt,
               rental_amt = p_rental_amt,
               marketing_id = p_marketing_id,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND mk_marketing_target_id = p_mk_marketing_target_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
   DROP FUNCTION public.fmk_marketing_target_u(p_mk_marketing_team_id integer, p_marketing_id character varying, p_years integer, p_month integer, p_ftl_amt numeric, p_ltl_amt numeric, p_project_amt numeric, p_rental_amt numeric, p_user_edit character varying);
       public       postgres    false            �           1255    210680 0   fmk_marketing_team_d(integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_marketing_team_d(p_ss_portfolio_id integer, p_user_id character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;v_parent_marketing varchar(20);
begin

      select a.marketing_id into v_parent_marketing
      from mk_marketing a
      where a.ss_portfolio_id = p_ss_portfolio_id
      AND a.user_id = p_user_id;
      
	DELETE FROM mk_marketing_team
    WHERE ss_portfolio_id = p_ss_portfolio_id AND user_id iLike p_user_id
	and child_marketing_id <> v_parent_marketing;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 c   DROP FUNCTION public.fmk_marketing_team_d(p_ss_portfolio_id integer, p_user_id character varying);
       public       postgres    false            �           1255    210754 q   fmk_marketing_team_i(integer, character varying, character varying, integer, integer, boolean, character varying)    FUNCTION     Z  CREATE FUNCTION public.fmk_marketing_team_i(p_ss_portfolio_id integer, p_user_id character varying, p_child_marketing_id character varying, p_monthly_point integer, p_monthly_new_prospect integer, p_my_team boolean, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;v_parent_marketing varchar(20);
begin

      select a.marketing_id into v_parent_marketing
      from mk_marketing a
      where a.ss_portfolio_id = p_ss_portfolio_id
      AND a.user_id = p_user_id;
      
      update mk_marketing
      set 	monthly_point = p_monthly_point,
      		monthly_new_prospect = p_monthly_new_prospect
      WHERE marketing_id = p_child_marketing_id
      AND ss_portfolio_id = p_ss_portfolio_id;
          GET DIAGNOSTICS v_count = ROW_COUNT;

       IF p_my_team = true THEN
              INSERT INTO 
        public.mk_marketing_team
          (
                ss_portfolio_id, 
                user_id, 
                parent_marketing_id, 
                child_marketing_id, 
                user_input, 
                user_edit
          )
        VALUES (
                p_ss_portfolio_id,
                p_user_id,
                v_parent_marketing,
                p_child_marketing_id,
                p_user_input,
                p_user_input
        );
          
          RETURN QUERY
          SELECT currval(pg_get_serial_sequence('mk_marketing_team', 'mk_marketing_team_id'))::integer as row_id;
        else
        RETURN QUERY
            select v_count as row_id;
       END IF;
 
end;
$$;
 �   DROP FUNCTION public.fmk_marketing_team_i(p_ss_portfolio_id integer, p_user_id character varying, p_child_marketing_id character varying, p_monthly_point integer, p_monthly_new_prospect integer, p_my_team boolean, p_user_input character varying);
       public       postgres    false            �           1255    210611 &   fmk_marketing_team_s(integer, integer)    FUNCTION     n  CREATE FUNCTION public.fmk_marketing_team_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(mk_marketing_team_id integer, ss_portfolio_id integer, user_id character varying, parent_marketing_id character varying, child_marketing_id character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.mk_marketing_team_id,
               a.ss_portfolio_id,
               a.user_id,
               a.parent_marketing_id,
               a.child_marketing_id,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.mk_marketing_team_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM mk_marketing_team a 
          WHERE a.mk_marketing_team_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 X   DROP FUNCTION public.fmk_marketing_team_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210609 {   fmk_marketing_team_u(integer, integer, character varying, character varying, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_marketing_team_u(p_mk_marketing_team_id integer, p_ss_portfolio_id integer, p_user_id character varying, p_parent_marketing_id character varying, p_child_marketing_id character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.mk_marketing_team set
               ss_portfolio_id = p_ss_portfolio_id,
               user_id = p_user_id,
               parent_marketing_id = p_parent_marketing_id,
               child_marketing_id = p_child_marketing_id,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND mk_marketing_team_id = p_mk_marketing_team_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
   DROP FUNCTION public.fmk_marketing_team_u(p_mk_marketing_team_id integer, p_ss_portfolio_id integer, p_user_id character varying, p_parent_marketing_id character varying, p_child_marketing_id character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210593 �   fmk_marketing_u(integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, boolean, timestamp without time zone, integer, integer, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_marketing_u(p_mk_marketing_id integer, p_ss_portfolio_id integer, p_user_id character varying, p_marketing_id character varying, p_name character varying, p_nik_id character varying, p_address character varying, p_email character varying, p_hand_phone character varying, p_status_active boolean, p_join_date timestamp without time zone, p_monthly_point integer, p_monthly_new_prospect integer, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.mk_marketing set
               ss_portfolio_id = p_ss_portfolio_id,
               user_id = p_user_id,
               marketing_id = p_marketing_id,
               name = p_name,
               nik_id = p_nik_id,
               address = p_address,
               email = p_email,
               hand_phone = p_hand_phone,
               status_active = p_status_active,
               join_date = p_join_date,
               monthly_point = p_monthly_point,
               monthly_new_prospect = p_monthly_new_prospect,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND mk_marketing_id = p_mk_marketing_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �  DROP FUNCTION public.fmk_marketing_u(p_mk_marketing_id integer, p_ss_portfolio_id integer, p_user_id character varying, p_marketing_id character varying, p_name character varying, p_nik_id character varying, p_address character varying, p_email character varying, p_hand_phone character varying, p_status_active boolean, p_join_date timestamp without time zone, p_monthly_point integer, p_monthly_new_prospect integer, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false                       1255    210849 C   fmk_new_prospect_dash(integer, character varying, integer, integer)    FUNCTION     A  CREATE FUNCTION public.fmk_new_prospect_dash(p_ss_portfolio_id integer, p_user_id character varying, p_years integer, p_months integer) RETURNS TABLE(target_prospect numeric, achievement_prospect numeric, monthly_point_target numeric, monthly_point_achievement numeric)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
		v_monthly_point INTEGER;
        v_monthly_new_prospect INTEGER;
        v_achievement_prospect INTEGER;
        v_monthly_point_achievement INTEGER;
        v_action_call_point INTEGER; 
		v_action_entertain_point INTEGER; 
        v_action_visit_point INTEGER; 
        v_marketing_id varchar;
        v_call_qty integer;
        v_entertain_qty integer;
        v_visit_qty integer;
        
BEGIN

	 select SUM(a.monthly_point) ,
     		SUM(a.monthly_new_prospect)
     into v_monthly_point, v_monthly_new_prospect
     from mk_marketing a
     INNER JOIN mk_marketing_team b ON 
     		a.marketing_id = b.child_marketing_id
     where b.ss_portfolio_id = p_ss_portfolio_id
     and b.user_id = p_user_id ;
     
     SELECT a.action_call_point, 
             a.action_entertain_point, 
             a.action_visit_point 
	 into v_action_call_point, v_action_entertain_point, v_action_visit_point
     FROM mk_spec a
     WHERE a.ss_portfolio_id = p_ss_portfolio_id;
     
     select sum(1)
     into v_achievement_prospect
     from cm_contact a 
     INNER JOIN mk_marketing b ON a.marketing_id = b.marketing_id
     INNER JOIN mk_marketing_team c ON b.marketing_id = c.child_marketing_id
     INNER JOIN cm_customer_status d ON d.cm_customer_status_id = a.cm_customer_status_id
     where c.ss_portfolio_id = p_ss_portfolio_id
     and c.user_id = p_user_id
     AND d.descs = 'New';
     
     select sum(case when a.action_type = 'C' then 1 else 0 end),
     		sum(case when a.action_type = 'V' then 1 else 0 end),
            sum(case when a.action_type = 'E' then 1 else 0 end) 
     INTO v_call_qty, v_visit_qty, v_entertain_qty	
     from mk_logbook a
     INNER JOIN mk_marketing b ON a.user_input = b.user_id
     INNER JOIN mk_marketing_team c ON b.marketing_id = c.child_marketing_id
     where c.ss_portfolio_id = p_ss_portfolio_id
     and c.user_id = p_user_id
     and EXTRACT(YEAR FROM a.logbook_date) = p_years
     and EXTRACT(MONTH FROM a.logbook_date) = p_months;
     
     v_monthly_point_achievement := (v_call_qty * v_action_call_point) + (v_visit_qty * v_action_visit_point) + (v_entertain_qty * v_action_entertain_point);
     
     DELETE FROM mk_new_prospect_dash  
     WHERE ss_portfolio_id = p_ss_portfolio_id 
     AND user_id = p_user_id 
     AND years = p_years
     AND months = p_months;
     
     INSERT INTO 
        public.mk_new_prospect_dash
            (
              ss_portfolio_id,
              user_id,
              years,
              months,
              target_prospect,
              achievement_prospect,
              monthly_point_target,
              monthly_point_achievement,
              user_input,
              user_edit
            )
            VALUES (
              p_ss_portfolio_id,
              p_user_id,
              p_years,
              p_months,
              v_monthly_new_prospect,
              v_achievement_prospect,
              v_monthly_point,
              v_monthly_point_achievement,
              p_user_id,
              p_user_id
            );
 	
      RETURN QUERY                
          SELECT 
               a.target_prospect,
               a.achievement_prospect,
               a.monthly_point_target,
               a.monthly_point_achievement
          FROM mk_new_prospect_dash a 
          WHERE a.ss_portfolio_id = p_ss_portfolio_id 
          AND a.user_id = p_user_id 
          AND a.years = p_years
          AND a.months = p_months
;
	 	  
END;
$$;
 �   DROP FUNCTION public.fmk_new_prospect_dash(p_ss_portfolio_id integer, p_user_id character varying, p_years integer, p_months integer);
       public       postgres    false                       1255    210879 F   fmk_new_prospect_dash_dt(integer, character varying, integer, integer)    FUNCTION     k  CREATE FUNCTION public.fmk_new_prospect_dash_dt(p_ss_portfolio_id integer, p_user_id character varying, p_years integer, p_months integer) RETURNS TABLE(marketing_id character varying, marketing_name character varying, target_prospect numeric, achievement_prospect numeric, monthly_point_target numeric, monthly_point_achievement numeric)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
		v_monthly_point INTEGER;
        v_monthly_new_prospect INTEGER;
        v_achievement_prospect INTEGER;
        v_monthly_point_achievement INTEGER;
        v_action_call_point INTEGER; 
		v_action_entertain_point INTEGER; 
        v_action_visit_point INTEGER; 
        v_marketing_id varchar;
        v_marketing_name varchar;
        v_call_qty integer;
        v_entertain_qty integer;
        v_visit_qty integer;
        data_loop RECORD;
        
BEGIN

	DELETE FROM mk_new_prospect_dash_dt a 
    WHERE a.ss_portfolio_id = p_ss_portfolio_id 
    AND a.user_id = p_user_id 
    AND a.years = p_years
    AND a.months = p_months;

     SELECT a.action_call_point, 
             a.action_entertain_point, 
             a.action_visit_point 
	 into v_action_call_point, v_action_entertain_point, v_action_visit_point
     FROM mk_spec a
     WHERE a.ss_portfolio_id = p_ss_portfolio_id;

    FOR data_loop IN
    	select a.marketing_id,
        		a.name as marketing_name
           from mk_marketing a
           INNER JOIN mk_marketing_team b ON 
                  a.marketing_id = b.child_marketing_id
           where b.ss_portfolio_id = p_ss_portfolio_id
           and b.user_id = p_user_id 
    LOOP
    	 select a.monthly_point ,
     		a.monthly_new_prospect
         into v_monthly_point, v_monthly_new_prospect
         from mk_marketing a
         where a.ss_portfolio_id = p_ss_portfolio_id
         and a.marketing_id = data_loop.marketing_id ;
         
         select sum(1)
         into v_achievement_prospect
         from cm_contact a 
         INNER JOIN cm_customer_status d ON d.cm_customer_status_id = a.cm_customer_status_id
         where a.ss_portfolio_id = p_ss_portfolio_id
         and a.marketing_id = data_loop.marketing_id
         AND d.descs = 'New'; 
         
         select sum(case when a.action_type = 'C' then 1 else 0 end),
                sum(case when a.action_type = 'V' then 1 else 0 end),
                sum(case when a.action_type = 'E' then 1 else 0 end) 
         INTO v_call_qty, v_visit_qty, v_entertain_qty	
         from mk_logbook a
         INNER JOIN mk_marketing b ON a.user_input = b.user_id
         where b.ss_portfolio_id = p_ss_portfolio_id
         and b.marketing_id = data_loop.marketing_id
         and EXTRACT(YEAR FROM a.logbook_date) = p_years
         and EXTRACT(MONTH FROM a.logbook_date) = p_months;                 
     
     	v_monthly_point_achievement := (v_call_qty * v_action_call_point) + (v_visit_qty * v_action_visit_point) + (v_entertain_qty * v_action_entertain_point);
     
		IF v_monthly_point_achievement IS NULL THEN
        	v_monthly_point_achievement := 0;
        END IF;    	
        
		IF v_achievement_prospect IS NULL THEN
        	v_achievement_prospect := 0;
        END IF;           
     
         INSERT INTO 
            public.mk_new_prospect_dash_dt
            (
              ss_portfolio_id,
              user_id,
              years,
              months,
              marketing_id,
              marketing_name,
              target_prospect,
              achievement_prospect,
              monthly_point_target,
              monthly_point_achievement,
              user_input,
              user_edit
            )
            VALUES (
              p_ss_portfolio_id,
              p_user_id,
              p_years,
              p_months,
              data_loop.marketing_id,
              data_loop.marketing_name,
              v_monthly_new_prospect,
              v_achievement_prospect,
              v_monthly_point,
              v_monthly_point_achievement,
              p_user_id,
              p_user_id
            );         
    END LOOP;
    


            
      RETURN QUERY                
          SELECT 
          	   a.marketing_id,
               a.marketing_name,	
               a.target_prospect,
               a.achievement_prospect,
               a.monthly_point_target,
               a.monthly_point_achievement
          FROM mk_new_prospect_dash_dt a 
          WHERE a.ss_portfolio_id = p_ss_portfolio_id 
          AND a.user_id = p_user_id 
          AND a.years = p_years
          AND a.months = p_months
;
	 	  
END;
$$;
 �   DROP FUNCTION public.fmk_new_prospect_dash_dt(p_ss_portfolio_id integer, p_user_id character varying, p_years integer, p_months integer);
       public       postgres    false                       1255    211013 "   fmk_open_order_d(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fmk_open_order_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM mk_open_order
    WHERE xmin::text::integer = p_lastupdatestamp   
		and mk_open_order_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 T   DROP FUNCTION public.fmk_open_order_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false                       1255    211011 h  fmk_open_order_i(integer, character varying, character varying, character varying, character varying, character varying, character varying, timestamp without time zone, character, character varying, character varying, character varying, character varying, numeric, timestamp without time zone, timestamp without time zone, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_open_order_i(p_ss_portfolio_id integer, p_customer_name character varying, p_customer_email character varying, p_customer_phone character varying, p_customer_contact_person character varying, p_customer_contact_phone_no character varying, p_order_no character varying, p_order_date timestamp without time zone, p_order_type character, p_project_name character varying, p_descs character varying, p_from_location character varying, p_to_location character varying, p_order_amt numeric, p_start_date timestamp without time zone, p_end_date timestamp without time zone, p_status character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.mk_open_order
    (
          ss_portfolio_id, 
          customer_name, 
          customer_email, 
          customer_phone, 
          customer_contact_person, 
          customer_contact_phone_no, 
          order_no, 
          order_date, 
          order_type, 
          project_name, 
          descs, 
          from_location, 
          to_location, 
          order_amt, 
          start_date, 
          end_date, 
          status, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_portfolio_id,
          p_customer_name,
          p_customer_email,
          p_customer_phone,
          p_customer_contact_person,
          p_customer_contact_phone_no,
          p_order_no,
          p_order_date,
          p_order_type,
          p_project_name,
          p_descs,
          p_from_location,
          p_to_location,
          p_order_amt,
          p_start_date,
          p_end_date,
          p_status,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('mk_open_order', 'mk_open_order_id'))::integer as row_id;
end;
$$;
 �  DROP FUNCTION public.fmk_open_order_i(p_ss_portfolio_id integer, p_customer_name character varying, p_customer_email character varying, p_customer_phone character varying, p_customer_contact_person character varying, p_customer_contact_phone_no character varying, p_order_no character varying, p_order_date timestamp without time zone, p_order_type character, p_project_name character varying, p_descs character varying, p_from_location character varying, p_to_location character varying, p_order_amt numeric, p_start_date timestamp without time zone, p_end_date timestamp without time zone, p_status character varying, p_user_input character varying);
       public       postgres    false                       1255    211014 "   fmk_open_order_s(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fmk_open_order_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(mk_open_order_id integer, ss_portfolio_id integer, customer_name character varying, customer_email character varying, customer_phone character varying, customer_contact_person character varying, customer_contact_phone_no character varying, order_no character varying, order_date timestamp without time zone, order_type character, project_name character varying, descs character varying, from_location character varying, to_location character varying, order_amt numeric, start_date timestamp without time zone, end_date timestamp without time zone, status character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.mk_open_order_id,
               a.ss_portfolio_id,
               a.customer_name,
               a.customer_email,
               a.customer_phone,
               a.customer_contact_person,
               a.customer_contact_phone_no,
               a.order_no,
               a.order_date,
               a.order_type,
               a.project_name,
               a.descs,
               a.from_location,
               a.to_location,
               a.order_amt,
               a.start_date,
               a.end_date,
               a.status,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.mk_open_order_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM mk_open_order a 
          WHERE a.mk_open_order_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 T   DROP FUNCTION public.fmk_open_order_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false                       1255    211012 z  fmk_open_order_u(integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, timestamp without time zone, character, character varying, character varying, character varying, character varying, numeric, timestamp without time zone, timestamp without time zone, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_open_order_u(p_mk_open_order_id integer, p_ss_portfolio_id integer, p_customer_name character varying, p_customer_email character varying, p_customer_phone character varying, p_customer_contact_person character varying, p_customer_contact_phone_no character varying, p_order_no character varying, p_order_date timestamp without time zone, p_order_type character, p_project_name character varying, p_descs character varying, p_from_location character varying, p_to_location character varying, p_order_amt numeric, p_start_date timestamp without time zone, p_end_date timestamp without time zone, p_status character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.mk_open_order set
               ss_portfolio_id = p_ss_portfolio_id,
               customer_name = p_customer_name,
               customer_email = p_customer_email,
               customer_phone = p_customer_phone,
               customer_contact_person = p_customer_contact_person,
               customer_contact_phone_no = p_customer_contact_phone_no,
               order_no = p_order_no,
               order_date = p_order_date,
               order_type = p_order_type,
               project_name = p_project_name,
               descs = p_descs,
               from_location = p_from_location,
               to_location = p_to_location,
               order_amt = p_order_amt,
               start_date = p_start_date,
               end_date = p_end_date,
               status = p_status,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND mk_open_order_id = p_mk_open_order_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �  DROP FUNCTION public.fmk_open_order_u(p_mk_open_order_id integer, p_ss_portfolio_id integer, p_customer_name character varying, p_customer_email character varying, p_customer_phone character varying, p_customer_contact_person character varying, p_customer_contact_phone_no character varying, p_order_no character varying, p_order_date timestamp without time zone, p_order_type character, p_project_name character varying, p_descs character varying, p_from_location character varying, p_to_location character varying, p_order_amt numeric, p_start_date timestamp without time zone, p_end_date timestamp without time zone, p_status character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false                        1255    210940 =   fmk_quotation__confirm_u(integer, integer, character varying)    FUNCTION     @  CREATE FUNCTION public.fmk_quotation__confirm_u(p_mk_quotation_id integer, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.mk_quotation set
               status = 'C',
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND mk_quotation_id = p_mk_quotation_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fmk_quotation__confirm_u(p_mk_quotation_id integer, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    209876 b   fmk_quotation__reason_u(integer, character varying, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_quotation__reason_u(p_mk_quotation_id integer, p_reason_cd character varying, p_reason_descs character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.mk_quotation set
               reason_cd = p_reason_cd,
               reason_descs = p_reason_descs,
               status = 'X',
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND mk_quotation_id = p_mk_quotation_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fmk_quotation__reason_u(p_mk_quotation_id integer, p_reason_cd character varying, p_reason_descs character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    209793 !   fmk_quotation_d(integer, integer)    FUNCTION     ~  CREATE FUNCTION public.fmk_quotation_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM mk_quotation
    WHERE xmin::text::integer = p_lastupdatestamp   
		and mk_quotation_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 S   DROP FUNCTION public.fmk_quotation_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210199 �   fmk_quotation_i(integer, integer, integer, timestamp without time zone, character, character varying, character varying, numeric, timestamp without time zone, character, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_quotation_i(p_ss_portfolio_id integer, p_ss_subportfolio_id integer, p_cm_contact_id integer, p_quotation_date timestamp without time zone, p_quotation_type character, p_project_name character varying, p_descs character varying, p_project_value numeric, p_expired_date timestamp without time zone, p_status character, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
		v_doc_no varchar :='';
begin

		select doc_no into v_doc_no
        from get_running_no('MK','mk_quotation');
        
        
  		INSERT INTO 
  public.mk_quotation
    (
          ss_portfolio_id, 
          ss_subportfolio_id, 
          cm_contact_id, 
          quotation_no, 
          quotation_date, 
          quotation_type, 
          project_name, 
          descs, 
          project_value, 
          expired_date, 
          status, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_portfolio_id,
          p_ss_subportfolio_id,
          p_cm_contact_id,
          v_doc_no,
          p_quotation_date,
          p_quotation_type,
          p_project_name,
          p_descs,
          p_project_value,
          p_expired_date,
          p_status,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('mk_quotation', 'mk_quotation_id'))::integer as row_id;
end;
$$;
 x  DROP FUNCTION public.fmk_quotation_i(p_ss_portfolio_id integer, p_ss_subportfolio_id integer, p_cm_contact_id integer, p_quotation_date timestamp without time zone, p_quotation_type character, p_project_name character varying, p_descs character varying, p_project_value numeric, p_expired_date timestamp without time zone, p_status character, p_user_input character varying);
       public       postgres    false            �           1255    209844 !   fmk_quotation_s(integer, integer)    FUNCTION     �
  CREATE FUNCTION public.fmk_quotation_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(mk_quotation_id integer, ss_portfolio_id integer, ss_subportfolio_id integer, cm_contact_id integer, quotation_no character varying, quotation_date timestamp without time zone, quotation_type character, project_name character varying, descs character varying, project_value numeric, expired_date timestamp without time zone, status character, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer, type text, name character varying, address character varying, country character varying, province character varying, city character varying, district character varying, phone_no character varying, email character varying, website character varying, contact_person character varying, contact_phone_no character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.mk_quotation_id,
               a.ss_portfolio_id,
               a.ss_subportfolio_id,
               a.cm_contact_id,
               a.quotation_no,
               a.quotation_date,
               a.quotation_type,
               a.project_name,
               a.descs,
               a.project_value,
               a.expired_date,
               a.status,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.mk_quotation_id as row_id,
               a.xmin::text::integer as lastupdatestamp ,
               CASE a.quotation_type
            WHEN 'F'::bpchar THEN 'FTL'::text
            WHEN 'L'::bpchar THEN 'LTL'::text
            WHEN 'R'::bpchar THEN 'Rental'::text
            ELSE 'Project Base'::text
        END AS type,
               b.name,
               b.address,
               scr.descs as country, spr.descs as province, sct.descs as city, sdt.descs as district,
  b.phone_no,b.email,b.website,b.contact_person,b.contact_phone_no
          FROM mk_quotation a inner join cm_contact b ON a.cm_contact_id = b.cm_contact_id
  left join ss_country scr on scr.ss_country_id = b.ss_country_id
          left join ss_province spr on spr.ss_country_id = b.ss_country_id and spr.ss_province_id = b.ss_province_id
          left join ss_city sct on sct.ss_province_id = b.ss_province_id and sct.ss_city_id = b.ss_city_id
          left join ss_district sdt on sdt.ss_city_id = b.ss_city_id and sdt.ss_district_id = b.ss_district_id
          WHERE a.mk_quotation_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 S   DROP FUNCTION public.fmk_quotation_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209792 �   fmk_quotation_u(integer, integer, integer, integer, character varying, timestamp without time zone, character, character varying, character varying, numeric, timestamp without time zone, character, integer, character varying)    FUNCTION     v  CREATE FUNCTION public.fmk_quotation_u(p_mk_quotation_id integer, p_ss_portfolio_id integer, p_ss_subportfolio_id integer, p_cm_contact_id integer, p_quotation_no character varying, p_quotation_date timestamp without time zone, p_quotation_type character, p_project_name character varying, p_descs character varying, p_project_value numeric, p_expired_date timestamp without time zone, p_status character, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.mk_quotation set
               ss_portfolio_id = p_ss_portfolio_id,
               ss_subportfolio_id = p_ss_subportfolio_id,
               cm_contact_id = p_cm_contact_id,
               quotation_no = p_quotation_no,
               quotation_date = p_quotation_date,
               quotation_type = p_quotation_type,
               project_name = p_project_name,
               descs = p_descs,
               project_value = p_project_value,
               expired_date = p_expired_date,
               status = p_status,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND mk_quotation_id = p_mk_quotation_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �  DROP FUNCTION public.fmk_quotation_u(p_mk_quotation_id integer, p_ss_portfolio_id integer, p_ss_subportfolio_id integer, p_cm_contact_id integer, p_quotation_no character varying, p_quotation_date timestamp without time zone, p_quotation_type character, p_project_name character varying, p_descs character varying, p_project_value numeric, p_expired_date timestamp without time zone, p_status character, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210707 �   fmk_spec_i(integer, integer, integer, integer, character, character, character, character, character, character, character, integer, character varying)    FUNCTION     T  CREATE FUNCTION public.fmk_spec_i(p_ss_portfolio_id integer, p_action_call_point integer, p_action_visit_point integer, p_action_entertain_point integer, p_working_days_monday character, p_working_days_tuesday character, p_working_days_wednesday character, p_working_days_thursday character, p_working_days_friday character, p_working_days_saturday character, p_working_days_sunday character, p_new_cm_customer_status_id integer, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.mk_spec
    (
          ss_portfolio_id, 
          action_call_point, 
          action_visit_point, 
          action_entertain_point, 
          working_days_monday, 
          working_days_tuesday, 
          working_days_wednesday, 
          working_days_thursday, 
          working_days_friday, 
          working_days_saturday, 
          working_days_sunday, 
          new_cm_customer_status_id, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_portfolio_id,
          p_action_call_point,
          p_action_visit_point,
          p_action_entertain_point,
          p_working_days_monday,
          p_working_days_tuesday,
          p_working_days_wednesday,
          p_working_days_thursday,
          p_working_days_friday,
          p_working_days_saturday,
          p_working_days_sunday,
          p_new_cm_customer_status_id,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT p_ss_portfolio_id as row_id;
end;
$$;
 �  DROP FUNCTION public.fmk_spec_i(p_ss_portfolio_id integer, p_action_call_point integer, p_action_visit_point integer, p_action_entertain_point integer, p_working_days_monday character, p_working_days_tuesday character, p_working_days_wednesday character, p_working_days_thursday character, p_working_days_friday character, p_working_days_saturday character, p_working_days_sunday character, p_new_cm_customer_status_id integer, p_user_input character varying);
       public       postgres    false            �           1255    210706    fmk_spec_s(integer)    FUNCTION     �  CREATE FUNCTION public.fmk_spec_s(p_portfolio_id integer) RETURNS TABLE(ss_portfolio_id integer, action_call_point integer, action_visit_point integer, action_entertain_point integer, working_days_monday character, working_days_tuesday character, working_days_wednesday character, working_days_thursday character, working_days_friday character, working_days_saturday character, working_days_sunday character, new_cm_customer_status_id integer, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.ss_portfolio_id,
               a.action_call_point,
               a.action_visit_point,
               a.action_entertain_point,
               a.working_days_monday,
               a.working_days_tuesday,
               a.working_days_wednesday,
               a.working_days_thursday,
               a.working_days_friday,
               a.working_days_saturday,
               a.working_days_sunday,
               a.new_cm_customer_status_id,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.xmin::text::integer as lastupdatestamp 
          FROM mk_spec a 
          WHERE a.ss_portfolio_id = p_portfolio_id 
;
	 	  
END;
$$;
 9   DROP FUNCTION public.fmk_spec_s(p_portfolio_id integer);
       public       postgres    false            �           1255    210709 �   fmk_spec_u(integer, integer, integer, integer, character, character, character, character, character, character, character, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_spec_u(p_ss_portfolio_id integer, p_action_call_point integer, p_action_visit_point integer, p_action_entertain_point integer, p_working_days_monday character, p_working_days_tuesday character, p_working_days_wednesday character, p_working_days_thursday character, p_working_days_friday character, p_working_days_saturday character, p_working_days_sunday character, p_new_cm_customer_status_id integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.mk_spec set
               action_call_point = p_action_call_point,
               action_visit_point = p_action_visit_point,
               action_entertain_point = p_action_entertain_point,
               working_days_monday = p_working_days_monday,
               working_days_tuesday = p_working_days_tuesday,
               working_days_wednesday = p_working_days_wednesday,
               working_days_thursday = p_working_days_thursday,
               working_days_friday = p_working_days_friday,
               working_days_saturday = p_working_days_saturday,
               working_days_sunday = p_working_days_sunday,
               new_cm_customer_status_id = p_new_cm_customer_status_id,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE ss_portfolio_id = p_ss_portfolio_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �  DROP FUNCTION public.fmk_spec_u(p_ss_portfolio_id integer, p_action_call_point integer, p_action_visit_point integer, p_action_entertain_point integer, p_working_days_monday character, p_working_days_tuesday character, p_working_days_wednesday character, p_working_days_thursday character, p_working_days_friday character, p_working_days_saturday character, p_working_days_sunday character, p_new_cm_customer_status_id integer, p_user_edit character varying);
       public       postgres    false            �           1255    209716 !   fmk_todo_list_d(integer, integer)    FUNCTION     ~  CREATE FUNCTION public.fmk_todo_list_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM mk_todo_list
    WHERE xmin::text::integer = p_lastupdatestamp   
		and mk_todo_list_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 S   DROP FUNCTION public.fmk_todo_list_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209714 Q   fmk_todo_list_i(integer, character varying, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_todo_list_i(p_cm_contact_id integer, p_action_type character varying, p_descs character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.mk_todo_list
    (
          cm_contact_id, 
          action_type, 
          descs, 
          user_input, 
          user_edit
    )
  VALUES (
          p_cm_contact_id,
          p_action_type,
          p_descs,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('mk_todo_list', 'mk_todo_list_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fmk_todo_list_i(p_cm_contact_id integer, p_action_type character varying, p_descs character varying, p_user_input character varying);
       public       postgres    false            �           1255    209717 !   fmk_todo_list_s(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fmk_todo_list_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(mk_todo_list_id integer, cm_contact_id integer, action_type character varying, descs character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.mk_todo_list_id,
               a.cm_contact_id,
               a.action_type,
               a.descs,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.mk_todo_list_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM mk_todo_list a 
          WHERE a.cm_contact_id = p_row_id 
          --AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 S   DROP FUNCTION public.fmk_todo_list_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209722    fmk_todo_list_s1(integer)    FUNCTION     �  CREATE FUNCTION public.fmk_todo_list_s1(p_row_id integer) RETURNS TABLE(mk_todo_list_id integer, cm_contact_id integer, action_type character varying, descs character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.mk_todo_list_id,
               a.cm_contact_id,
               a.action_type,
               a.descs,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.mk_todo_list_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM mk_todo_list a 
          WHERE a.mk_todo_list_id = p_row_id 
;
	 	  
END;
$$;
 9   DROP FUNCTION public.fmk_todo_list_s1(p_row_id integer);
       public       postgres    false            �           1255    209715 c   fmk_todo_list_u(integer, integer, character varying, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_todo_list_u(p_mk_todo_list_id integer, p_cm_contact_id integer, p_action_type character varying, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.mk_todo_list set
               cm_contact_id = p_cm_contact_id,
               action_type = p_action_type,
               descs = p_descs,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE /*xmin::text::integer = p_lastupdatestamp
        AND*/ mk_todo_list_id = p_mk_todo_list_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fmk_todo_list_u(p_mk_todo_list_id integer, p_cm_contact_id integer, p_action_type character varying, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210526 *   fmk_todolist_p(integer, character varying)    FUNCTION     �	  CREATE FUNCTION public.fmk_todolist_p(p_ss_portfolio_id integer, p_user_id character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer; v_logbook_date timestamp WITHOUT time zone;v_date timestamp WITHOUT time zone;
		v_contact_person_id integer;v_iday integer; data_loop RECORD;
begin	

	v_date := now()::timestamp WITHOUT time zone;
    
    /*Delete mk_appointment*/
    DELETE FROM mk_appointment
    WHERE status ='N' 
    AND appointment_type='T' 
    AND user_input = p_user_id;
    
    FOR data_loop IN
    	SELECT 	a.cm_contact_id,
             	b.action_type,b.action,b.month,b.freq
        FROM cm_contact a inner join cm_customer_status_dtl b
        ON a.cm_customer_status_id = b.cm_customer_status_id
        where EXISTS(
        	select 1 from cm_contact_person p
            where p.cm_contact_id = a.cm_contact_id
        )
        order by a.cm_contact_id,b.action_type
    LOOP
    	SELECT max(m.logbook_date) into v_logbook_date
        FROM mk_logbook m
        WHERE m.cm_contact_id = data_loop.cm_contact_id
        and m.action_type = data_loop.action_type;
        
        SELECT MAX(p.cm_contact_person_id) into v_contact_person_id
        FROM cm_contact_person p
        WHERE p.cm_contact_id = data_loop.cm_contact_id;
        
        /*RAISE NOTICE 'v_contact_person_id : %', v_contact_person_id;       
        RAISE NOTICE 'v_date : %', v_date;       
        RAISE NOTICE '%', data_loop.cm_contact_id;
        RAISE NOTICE 'v_logbook_date : %', v_logbook_date;*/
        
        IF v_logbook_date is null THEN
	        PERFORM public.fmk_appointment_i(data_loop.cm_contact_id,	p_ss_portfolio_id,	data_loop.action_type,
                            				 v_date,					'',					data_loop.action,
                                             v_contact_person_id,		'T',				p_user_id);
        ELSE
        	v_iday := (data_loop.month*30)/data_loop.freq;
            v_logbook_date := v_logbook_date + interval '1' day * v_iday;
            IF v_logbook_date <= v_date THEN
	        PERFORM public.fmk_appointment_i(data_loop.cm_contact_id,	p_ss_portfolio_id,	data_loop.action_type,
                            				 v_date,					'',					data_loop.action,
                                             v_contact_person_id,		'T',				p_user_id);
            END IF;
        END IF;
    
    END LOOP;
        
    
        
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 ]   DROP FUNCTION public.fmk_todolist_p(p_ss_portfolio_id integer, p_user_id character varying);
       public       postgres    false            
           1255    210954 /   fmk_todolist_p_dash(integer, character varying)    FUNCTION     H  CREATE FUNCTION public.fmk_todolist_p_dash(p_ss_portfolio_id integer, p_user_id character varying) RETURNS TABLE(cm_contact_id integer, customer_name character varying, status character varying, customer_status_colour character varying, action character, appointment_type character, last_action timestamp without time zone, next_action timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer; v_logbook_date timestamp WITHOUT time zone;v_date timestamp WITHOUT time zone;
		v_contact_person_id integer;v_iday integer; data_loop RECORD;
begin	

	v_date := now()::timestamp WITHOUT time zone;
    
    /*Delete mk_appointment*/
    DELETE FROM mk_appointment
    WHERE mk_appointment.status ='N' 
    AND mk_appointment.appointment_type='T' 
    AND mk_appointment.user_input = p_user_id;
    
    FOR data_loop IN
    	SELECT 	a.cm_contact_id,
             	b.action_type,b.action,b.month,b.freq
        FROM cm_contact a inner join cm_customer_status_dtl b
        ON a.cm_customer_status_id = b.cm_customer_status_id
        where EXISTS(
        	select 1 from cm_contact_person p
            where p.cm_contact_id = a.cm_contact_id
        )
        order by a.cm_contact_id,b.action_type
    LOOP
    	SELECT max(m.logbook_date) into v_logbook_date
        FROM mk_logbook m
        WHERE m.cm_contact_id = data_loop.cm_contact_id
        and m.action_type = data_loop.action_type;
        
        SELECT MAX(p.cm_contact_person_id) into v_contact_person_id
        FROM cm_contact_person p
        WHERE p.cm_contact_id = data_loop.cm_contact_id;
        
        /*RAISE NOTICE 'v_contact_person_id : %', v_contact_person_id;       
        RAISE NOTICE 'v_date : %', v_date;       
        RAISE NOTICE '%', data_loop.cm_contact_id;
        RAISE NOTICE 'v_logbook_date : %', v_logbook_date;*/
        
        IF v_logbook_date is null THEN
	        PERFORM public.fmk_appointment_i(data_loop.cm_contact_id,	p_ss_portfolio_id,	data_loop.action_type,
                            				 v_date,					'',					data_loop.action,
                                             v_contact_person_id,		'T',				p_user_id);
        ELSE
        	v_iday := (data_loop.month*30)/data_loop.freq;
            v_logbook_date := v_logbook_date + interval '1' day * v_iday;
            IF v_logbook_date <= v_date THEN
	        PERFORM public.fmk_appointment_i(data_loop.cm_contact_id,	p_ss_portfolio_id,	data_loop.action_type,
                            				 v_date,					'',					data_loop.action,
                                             v_contact_person_id,		'T',				p_user_id);
            END IF;
        END IF;
    
    END LOOP;
    
    RETURN QUERY    
    SELECT b.cm_contact_id,
        b.name AS customer_name,
        c.descs AS status,
        c.customer_status_colour,
        x.action_type AS action,
        x.appointment_type,
        (
        SELECT max(m.logbook_date) AS last_action
        FROM mk_logbook m
        WHERE m.ss_portfolio_id = x.ss_portfolio_id AND m.cm_contact_id = x.cm_contact_id
        ) AS last_action,
        x.appointment_date AS next_action,
        x.time_edit,
        x.mk_appointment_id AS row_id,
        x.xmin::text::integer AS lastupdatestamp
    FROM mk_appointment x
         JOIN cm_contact b ON x.cm_contact_id = b.cm_contact_id
         JOIN cm_customer_status c ON b.cm_customer_status_id = c.cm_customer_status_id
    WHERE x.appointment_type = 'T'
    AND x.user_input = p_user_id     
limit 4;
        

end;
$$;
 b   DROP FUNCTION public.fmk_todolist_p_dash(p_ss_portfolio_id integer, p_user_id character varying);
       public       postgres    false                       1255    210894 #   fmk_trx_logbook_d(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fmk_trx_logbook_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM mk_trx_logbook
    WHERE xmin::text::integer = p_lastupdatestamp   
		and mk_trx_logbook_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 U   DROP FUNCTION public.fmk_trx_logbook_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false                       1255    210892 �   fmk_trx_logbook_i(integer, character, character varying, timestamp without time zone, character varying, integer, integer, character, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_trx_logbook_i(p_ss_portfolio_id integer, p_logbook_type character, p_referance_no character varying, p_logbook_date timestamp without time zone, p_descs character varying, p_cm_contact_id integer, p_cm_contact_person_id integer, p_action_type character, p_meeting_address character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.mk_trx_logbook
    (
          ss_portfolio_id, 
          logbook_type, 
          referance_no, 
          logbook_date, 
          descs, 
          cm_contact_id, 
          cm_contact_person_id, 
          action_type, 
          meeting_address, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_portfolio_id,
          p_logbook_type,
          p_referance_no,
          p_logbook_date,
          p_descs,
          p_cm_contact_id,
          p_cm_contact_person_id,
          p_action_type,
          p_meeting_address,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('mk_trx_logbook', 'mk_trx_logbook_id'))::integer as row_id;
end;
$$;
 ]  DROP FUNCTION public.fmk_trx_logbook_i(p_ss_portfolio_id integer, p_logbook_type character, p_referance_no character varying, p_logbook_date timestamp without time zone, p_descs character varying, p_cm_contact_id integer, p_cm_contact_person_id integer, p_action_type character, p_meeting_address character varying, p_user_input character varying);
       public       postgres    false                       1255    210895 #   fmk_trx_logbook_s(integer, integer)    FUNCTION     z  CREATE FUNCTION public.fmk_trx_logbook_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(mk_trx_logbook_id integer, ss_portfolio_id integer, logbook_type character, referance_no character varying, logbook_date timestamp without time zone, descs character varying, cm_contact_id integer, cm_contact_person_id integer, action_type character, meeting_address character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.mk_trx_logbook_id,
               a.ss_portfolio_id,
               a.logbook_type,
               a.referance_no,
               a.logbook_date,
               a.descs,
               a.cm_contact_id,
               a.cm_contact_person_id,
               a.action_type,
               a.meeting_address,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.mk_trx_logbook_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM mk_trx_logbook a 
          WHERE a.mk_trx_logbook_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 U   DROP FUNCTION public.fmk_trx_logbook_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false                       1255    210893 �   fmk_trx_logbook_u(integer, integer, character, character varying, timestamp without time zone, character varying, integer, integer, character, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fmk_trx_logbook_u(p_mk_trx_logbook_id integer, p_ss_portfolio_id integer, p_logbook_type character, p_referance_no character varying, p_logbook_date timestamp without time zone, p_descs character varying, p_cm_contact_id integer, p_cm_contact_person_id integer, p_action_type character, p_meeting_address character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.mk_trx_logbook set
               ss_portfolio_id = p_ss_portfolio_id,
               logbook_type = p_logbook_type,
               referance_no = p_referance_no,
               logbook_date = p_logbook_date,
               descs = p_descs,
               cm_contact_id = p_cm_contact_id,
               cm_contact_person_id = p_cm_contact_person_id,
               action_type = p_action_type,
               meeting_address = p_meeting_address,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND mk_trx_logbook_id = p_mk_trx_logbook_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �  DROP FUNCTION public.fmk_trx_logbook_u(p_mk_trx_logbook_id integer, p_ss_portfolio_id integer, p_logbook_type character, p_referance_no character varying, p_logbook_date timestamp without time zone, p_descs character varying, p_cm_contact_id integer, p_cm_contact_person_id integer, p_action_type character, p_meeting_address character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    209842    fn_getdata_cm_contact(integer)    FUNCTION     �  CREATE FUNCTION public.fn_getdata_cm_contact(p_row_id integer) RETURNS TABLE(cm_contact_id integer, ss_portfolio_id integer, contact_type character, contact_status character, contact_created timestamp without time zone, name character varying, address character varying, ss_country_id integer, country character varying, ss_province_id integer, province character varying, ss_city_id integer, city character varying, ss_district_id integer, district character varying, phone_no character varying, email character varying, website character varying, contact_person character varying, contact_phone_no character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer, file_name character varying, path_file character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.cm_contact_id,
               a.ss_portfolio_id,
               a.contact_type,
               a.contact_status,
               a.contact_created,
               a.name,
               a.address,
               a.ss_country_id,
               b.descs as country,
               a.ss_province_id,
               c.descs as province,
               a.ss_city_id,
               d.descs as city,
               a.ss_district_id,
               e.descs as district,
               a.phone_no,
               a.email,
               a.website,
               a.contact_person,
               a.contact_phone_no,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.cm_contact_id as row_id,
               a.xmin::text::integer as lastupdatestamp,
               a.file_name,
               a.path_file
          FROM cm_contact a inner join ss_country b on a.ss_country_id = b.ss_country_id
          inner  join ss_province c on a.ss_province_id = c.ss_province_id
          inner  join ss_city d on a.ss_city_id = d.ss_city_id
          inner  join ss_district e on a.ss_district_id = e.ss_district_id
          WHERE a.cm_contact_id = p_row_id
;
	 	  
END;
$$;
 >   DROP FUNCTION public.fn_getdata_cm_contact(p_row_id integer);
       public       postgres    false            �           1255    210010     fop_location_d(integer, integer)    FUNCTION     {  CREATE FUNCTION public.fop_location_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM op_location
    WHERE xmin::text::integer = p_lastupdatestamp   
		and op_location_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 R   DROP FUNCTION public.fop_location_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210008 G   fop_location_i(character varying, character varying, character varying)    FUNCTION     f  CREATE FUNCTION public.fop_location_i(p_location_cd character varying, p_descs character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.op_location
    (
          location_cd, 
          descs, 
          user_input, 
          user_edit
    )
  VALUES (
          p_location_cd,
          p_descs,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('op_location', 'op_location_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fop_location_i(p_location_cd character varying, p_descs character varying, p_user_input character varying);
       public       postgres    false            �           1255    210011     fop_location_s(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fop_location_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(op_location_id integer, location_cd character varying, descs character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.op_location_id,
               a.location_cd,
               a.descs,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.op_location_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM op_location a 
          WHERE a.op_location_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 R   DROP FUNCTION public.fop_location_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210009 Y   fop_location_u(integer, character varying, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fop_location_u(p_op_location_id integer, p_location_cd character varying, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.op_location set
               location_cd = p_location_cd,
               descs = p_descs,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND op_location_id = p_op_location_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fop_location_u(p_op_location_id integer, p_location_cd character varying, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210094    fop_order_d_d(integer, integer)    FUNCTION     x  CREATE FUNCTION public.fop_order_d_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM op_order_d
    WHERE xmin::text::integer = p_lastupdatestamp   
		and op_order_d_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 Q   DROP FUNCTION public.fop_order_d_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210092 E   fop_order_d_i(integer, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fop_order_d_i(p_op_order_h_id integer, p_descs character varying, p_qty integer, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.op_order_d
    (
          op_order_h_id, 
          descs, 
          qty, 
          user_input, 
          user_edit
    )
  VALUES (
          p_op_order_h_id,
          p_descs,
          p_qty,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('op_order_d', 'op_order_d_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fop_order_d_i(p_op_order_h_id integer, p_descs character varying, p_qty integer, p_user_input character varying);
       public       postgres    false            �           1255    210095    fop_order_d_s(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fop_order_d_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(op_order_d_id integer, op_order_h_id integer, descs character varying, qty integer, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.op_order_d_id,
               a.op_order_h_id,
               a.descs,
               a.qty,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.op_order_d_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM op_order_d a 
          WHERE a.op_order_d_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 Q   DROP FUNCTION public.fop_order_d_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210093 W   fop_order_d_u(integer, integer, character varying, integer, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fop_order_d_u(p_op_order_d_id integer, p_op_order_h_id integer, p_descs character varying, p_qty integer, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.op_order_d set
               op_order_h_id = p_op_order_h_id,
               descs = p_descs,
               qty = p_qty,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND op_order_d_id = p_op_order_d_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fop_order_d_u(p_op_order_d_id integer, p_op_order_h_id integer, p_descs character varying, p_qty integer, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210102    fop_order_h_d(integer, integer)    FUNCTION     x  CREATE FUNCTION public.fop_order_h_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM op_order_h
    WHERE xmin::text::integer = p_lastupdatestamp   
		and op_order_h_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 Q   DROP FUNCTION public.fop_order_h_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210114    fop_order_h_i(integer, integer, character varying, integer, integer, character varying, character, character varying, character, numeric, character varying, character varying, integer, integer, timestamp without time zone, integer, integer, character, numeric, numeric, character varying)    FUNCTION     
  CREATE FUNCTION public.fop_order_h_i(p_ss_portfolio_id integer, p_ss_subportfolio_id integer, p_order_status character varying, p_cm_contact_id integer, p_cm_contact_person_id integer, p_ref_no character varying, p_booking_category character, p_contract_no character varying, p_base_type character, p_base_total numeric, p_base_pickup character varying, p_base_rest_of character varying, p_pickup_from_id integer, p_deliver_to_id integer, p_pickup_date timestamp without time zone, p_extra_pickup_id integer, p_extra_deliver_id integer, p_truck_type character, p_weight numeric, p_cubic numeric, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_max_order_no varchar(10)='';v_no integer;
begin

	/*select max(order_no) into v_max_order_no
    from op_order_h;
    
    IF v_max_order_no = '' THEN
    	v_max_order_no := 'ODR000001';
    ELSE
    	v_no := ('1'||SUBSTRING(v_max_order_no,4))::integer +1;
        v_max_order_no := 'ODR'||SUBSTRING(v_no::varchar,2);
    END IF;*/
    
    select doc_no into v_max_order_no
    from get_running_no('OP','op_order_h');
    
    
    
  		INSERT INTO 
  public.op_order_h
    (
          ss_portfolio_id, 
          ss_subportfolio_id, 
          order_no, 
          order_status, 
          cm_contact_id, 
          cm_contact_person_id, 
          ref_no, 
          booking_category, 
          contract_no, 
          base_type, 
          base_total, 
          base_pickup, 
          base_rest_of, 
          pickup_from_id, 
          deliver_to_id, 
          pickup_date, 
          extra_pickup_id, 
          extra_deliver_id, 
          truck_type, 
          weight, 
          cubic, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_portfolio_id,
          p_ss_subportfolio_id,
          v_max_order_no,
          p_order_status,
          p_cm_contact_id,
          p_cm_contact_person_id,
          p_ref_no,
          p_booking_category,
          p_contract_no,
          p_base_type,
          p_base_total,
          p_base_pickup,
          p_base_rest_of,
          p_pickup_from_id,
          p_deliver_to_id,
          p_pickup_date,
          p_extra_pickup_id,
          p_extra_deliver_id,
          p_truck_type,
          p_weight,
          p_cubic,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('op_order_h', 'op_order_h_id'))::integer as row_id;
end;
$$;
 s  DROP FUNCTION public.fop_order_h_i(p_ss_portfolio_id integer, p_ss_subportfolio_id integer, p_order_status character varying, p_cm_contact_id integer, p_cm_contact_person_id integer, p_ref_no character varying, p_booking_category character, p_contract_no character varying, p_base_type character, p_base_total numeric, p_base_pickup character varying, p_base_rest_of character varying, p_pickup_from_id integer, p_deliver_to_id integer, p_pickup_date timestamp without time zone, p_extra_pickup_id integer, p_extra_deliver_id integer, p_truck_type character, p_weight numeric, p_cubic numeric, p_user_input character varying);
       public       postgres    false            �           1255    210116    fop_order_h_s(integer, integer)    FUNCTION       CREATE FUNCTION public.fop_order_h_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(op_order_h_id integer, ss_portfolio_id integer, ss_subportfolio_id integer, order_no character varying, order_date timestamp without time zone, order_status character varying, cm_contact_id integer, contact_name character varying, cm_contact_person_id integer, contact_person_name character varying, ref_no character varying, booking_category character, contract_no character varying, base_type character, base_total numeric, base_pickup character varying, base_rest_of character varying, pickup_from_id integer, location_pickup character varying, deliver_to_id integer, location_deliver character varying, pickup_date timestamp without time zone, extra_pickup_id integer, location_extra_pickup character varying, extra_deliver_id integer, location_extra_deliver character varying, truck_type character, weight numeric, cubic numeric, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.op_order_h_id,
               a.ss_portfolio_id,
               a.ss_subportfolio_id,
               a.order_no,
               a.order_date,
               a.order_status,
               a.cm_contact_id,
               b.name as contact_name,
               a.cm_contact_person_id,
               c.name as contact_person_name,
               a.ref_no,
               a.booking_category,
               a.contract_no,
               a.base_type,
               a.base_total,
               a.base_pickup,
               a.base_rest_of,
               a.pickup_from_id,
               d.location_cd as location_pickup,
               a.deliver_to_id,
               e.location_cd as location_deliver,
               a.pickup_date,
               a.extra_pickup_id,
               f.location_cd as location_extra_pickup,
               a.extra_deliver_id,
               g.location_cd as location_xtra_deliver,
               a.truck_type,
               a.weight,
               a.cubic,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.op_order_h_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM op_order_h a inner join cm_contact b
          		ON a.cm_contact_id = b.cm_contact_id
                AND a.ss_portfolio_id = b.ss_portfolio_id
          inner JOIN cm_contact_person c
          		ON c.cm_contact_person_id = a.cm_contact_person_id
                AND c.cm_contact_id = a.cm_contact_id
          left outer join op_location d
          		ON d.op_location_id = a.pickup_from_id
          left outer join op_location e
          		ON e.op_location_id = a.deliver_to_id                
          left outer join op_location f
          		ON f.op_location_id = a.extra_pickup_id                
          left outer join op_location g
          		ON g.op_location_id = a.extra_deliver_id                      
          WHERE a.op_order_h_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 Q   DROP FUNCTION public.fop_order_h_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210159 +   fop_order_h_s_with_detail(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fop_order_h_s_with_detail(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(op_order_h_id integer, ss_portfolio_id integer, ss_subportfolio_id integer, order_no character varying, order_date timestamp without time zone, order_status character varying, cm_contact_id integer, contact_name character varying, cm_contact_person_id integer, contact_person_name character varying, ref_no character varying, booking_category character, contract_no character varying, base_type character, base_total numeric, base_pickup character varying, base_rest_of character varying, pickup_from_id integer, location_pickup character varying, deliver_to_id integer, location_deliver character varying, pickup_date timestamp without time zone, extra_pickup_id integer, location_extra_pickup character varying, extra_deliver_id integer, location_extra_deliver character varying, truck_type character, weight numeric, cubic numeric, ftl_truck character varying, ftl_qty integer, op_order_d_id integer, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer, lastupdatestamp_d integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.op_order_h_id,
               a.ss_portfolio_id,
               a.ss_subportfolio_id,
               a.order_no,
               a.order_date,
               a.order_status,
               a.cm_contact_id,
               b.name as contact_name,
               a.cm_contact_person_id,
               c.name as contact_person_name,
               a.ref_no,
               a.booking_category,
               a.contract_no,
               a.base_type,
               a.base_total,
               a.base_pickup,
               a.base_rest_of,
               a.pickup_from_id,
               d.location_cd as location_pickup,
               a.deliver_to_id,
               e.location_cd as location_deliver,
               a.pickup_date,
               a.extra_pickup_id,
               f.location_cd as location_extra_pickup,
               a.extra_deliver_id,
               g.location_cd as location_xtra_deliver,
               a.truck_type,
               a.weight,
               a.cubic,
               dt.descs as ftl_truck,
               dt.qty as ftl_qty,
               dt.op_order_d_id,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.op_order_h_id as row_id,
               a.xmin::text::integer as lastupdatestamp,
               dt.xmin::text::integer as lastupdatestamp_d
          FROM op_order_h a inner join cm_contact b
          		ON a.cm_contact_id = b.cm_contact_id
                AND a.ss_portfolio_id = b.ss_portfolio_id
          inner JOIN cm_contact_person c
          		ON c.cm_contact_person_id = a.cm_contact_person_id
                AND c.cm_contact_id = a.cm_contact_id
          left outer join op_location d
          		ON d.op_location_id = a.pickup_from_id
          left outer join op_location e
          		ON e.op_location_id = a.deliver_to_id                
          left outer join op_location f
          		ON f.op_location_id = a.extra_pickup_id                
          left outer join op_location g
          		ON g.op_location_id = a.extra_deliver_id       
          left join op_order_d dt
          		ON dt.op_order_h_id = a.op_order_h_id              
          WHERE a.op_order_h_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 ]   DROP FUNCTION public.fop_order_h_s_with_detail(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210115 E  fop_order_h_u(integer, integer, integer, character varying, character varying, integer, integer, character varying, character, character varying, character, numeric, character varying, character varying, integer, integer, timestamp without time zone, integer, integer, character, numeric, numeric, integer, character varying)    FUNCTION     5  CREATE FUNCTION public.fop_order_h_u(p_op_order_h_id integer, p_ss_portfolio_id integer, p_ss_subportfolio_id integer, p_order_no character varying, p_order_status character varying, p_cm_contact_id integer, p_cm_contact_person_id integer, p_ref_no character varying, p_booking_category character, p_contract_no character varying, p_base_type character, p_base_total numeric, p_base_pickup character varying, p_base_rest_of character varying, p_pickup_from_id integer, p_deliver_to_id integer, p_pickup_date timestamp without time zone, p_extra_pickup_id integer, p_extra_deliver_id integer, p_truck_type character, p_weight numeric, p_cubic numeric, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.op_order_h set
               ss_portfolio_id = p_ss_portfolio_id,
               ss_subportfolio_id = p_ss_subportfolio_id,
               order_no = p_order_no,
               order_status = p_order_status,
               cm_contact_id = p_cm_contact_id,
               cm_contact_person_id = p_cm_contact_person_id,
               ref_no = p_ref_no,
               booking_category = p_booking_category,
               contract_no = p_contract_no,
               base_type = p_base_type,
               base_total = p_base_total,
               base_pickup = p_base_pickup,
               base_rest_of = p_base_rest_of,
               pickup_from_id = p_pickup_from_id,
               deliver_to_id = p_deliver_to_id,
               pickup_date = p_pickup_date,
               extra_pickup_id = p_extra_pickup_id,
               extra_deliver_id = p_extra_deliver_id,
               truck_type = p_truck_type,
               weight = p_weight,
               cubic = p_cubic,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND op_order_h_id = p_op_order_h_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �  DROP FUNCTION public.fop_order_h_u(p_op_order_h_id integer, p_ss_portfolio_id integer, p_ss_subportfolio_id integer, p_order_no character varying, p_order_status character varying, p_cm_contact_id integer, p_cm_contact_person_id integer, p_ref_no character varying, p_booking_category character, p_contract_no character varying, p_base_type character, p_base_total numeric, p_base_pickup character varying, p_base_rest_of character varying, p_pickup_from_id integer, p_deliver_to_id integer, p_pickup_date timestamp without time zone, p_extra_pickup_id integer, p_extra_deliver_id integer, p_truck_type character, p_weight numeric, p_cubic numeric, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    209926    fss_chat_d_d(integer, integer)    FUNCTION     u  CREATE FUNCTION public.fss_chat_d_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM ss_chat_d
    WHERE xmin::text::integer = p_lastupdatestamp   
		and ss_chat_d_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 P   DROP FUNCTION public.fss_chat_d_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209967 '   fss_chat_d_getallchat(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fss_chat_d_getallchat(p_header_id integer, p_page integer) RETURNS TABLE(chat_text character varying, chat_date timestamp without time zone, user_id_from character varying, user_name character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE v_ioffset INTEGER; 
DECLARE v_per_row integer;
BEGIN 	
   v_per_row := 20;
   v_ioffset := (p_page*v_per_row)-v_per_row;
   
      RETURN QUERY              
        with result_set as (          
          SELECT 
          	   a.ss_chat_d_id,
               a.chat_text,
               a.chat_date,
               a.user_id_from,
               b.user_name
          FROM ss_chat_d a inner join ss_user b
          	ON a.user_id_from = b.user_id
          WHERE a.ss_chat_h_id = p_header_id 
          order by a.ss_chat_d_id desc
          limit v_per_row
 		  offset v_ioffset
		)
        select x.chat_text,x.chat_date,x.user_id_from,x.user_name from result_set x
        order by x.ss_chat_d_id asc
;
	 	  
END;
$$;
 Q   DROP FUNCTION public.fss_chat_d_getallchat(p_header_id integer, p_page integer);
       public       postgres    false            �           1255    209966 .   fss_chat_d_getchat(integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fss_chat_d_getchat(p_header_id integer, p_user_id character varying) RETURNS TABLE(ss_chat_d_id integer, chat_text character varying, chat_date timestamp without time zone, user_id_from character varying, user_name character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE v_is_read BOOLEAN;v_detail_id integer ; 
BEGIN 	
		  SELECT 
               max(a.ss_chat_d_id)  into v_detail_id             
          FROM ss_chat_d a inner join ss_chat_d_read_id d
          	ON a.ss_chat_d_id = d.ss_chat_d_id
          WHERE a.ss_chat_h_id = p_header_id 
          and a.user_id_to ilike '%'||p_user_id||'%'
          and d.user_id_to  ilike p_user_id
          and d.is_read = FALSE;
          
          select x.is_read into v_is_read
          from ss_chat_d_read_id x
          where x.ss_chat_d_id = v_detail_id
          and x.user_id_to = p_user_id;
          
          IF(v_is_read = TRUE) THEN
              RETURN QUERY       
              SELECT 
                   a.ss_chat_d_id,
                   a.chat_text,
                   a.chat_date,
                   a.user_id_from,
                   b.user_name
              FROM ss_chat_d a inner join ss_user b
                ON a.user_id_from = b.user_id
              WHERE a.ss_chat_h_id = p_header_id 
              and a.user_id_to  ilike 'XX'||p_user_id||'XX'
              and a.is_read = false
              order by a.ss_chat_d_id asc;
          ELSE
              RETURN QUERY       
              SELECT 
                   a.ss_chat_d_id,
                   a.chat_text,
                   a.chat_date,
                   a.user_id_from,
                   b.user_name
              FROM ss_chat_d a inner join ss_user b
                ON a.user_id_from = b.user_id
              inner join ss_chat_d_read_id d
              	ON d.ss_chat_d_id = a.ss_chat_d_id
                and d.user_id_to = p_user_id
                and d.is_read = false
              WHERE a.ss_chat_h_id = p_header_id 
              and a.user_id_to  ilike '%'||p_user_id||'%'
              order by a.ss_chat_d_id asc ;
          END IF;

	
      
	 	  
END;
$$;
 [   DROP FUNCTION public.fss_chat_d_getchat(p_header_id integer, p_user_id character varying);
       public       postgres    false            �           1255    209924 ~   fss_chat_d_i(integer, character varying, timestamp without time zone, character varying, character varying, character varying)    FUNCTION     c  CREATE FUNCTION public.fss_chat_d_i(p_ss_chat_h_id integer, p_chat_text character varying, p_chat_date timestamp without time zone, p_user_id_from character varying, p_user_id_to character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.ss_chat_d
    (
          ss_chat_h_id, 
          chat_text, 
          chat_date, 
          user_id_from, 
          user_id_to, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_chat_h_id,
          p_chat_text,
          p_chat_date,
          p_user_id_from,
          p_user_id_to,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('ss_chat_d', 'ss_chat_d_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fss_chat_d_i(p_ss_chat_h_id integer, p_chat_text character varying, p_chat_date timestamp without time zone, p_user_id_from character varying, p_user_id_to character varying, p_user_input character varying);
       public       postgres    false            �           1255    210206 _   fss_chat_d_read_id_i(integer, character varying, character varying, boolean, character varying)    FUNCTION       CREATE FUNCTION public.fss_chat_d_read_id_i(p_ss_chat_d_id integer, p_user_id_from character varying, p_user_id_to character varying, p_is_read boolean, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.ss_chat_d_read_id
    (
          ss_chat_d_id, 
          user_id_from, 
          user_id_to, 
          is_read, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_chat_d_id,
          p_user_id_from,
          p_user_id_to,
          p_is_read,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('ss_chat_d_read_id', 'ss_chat_d_read_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fss_chat_d_read_id_i(p_ss_chat_d_id integer, p_user_id_from character varying, p_user_id_to character varying, p_is_read boolean, p_user_input character varying);
       public       postgres    false            �           1255    210207 J   fss_chat_d_read_id_u_status(integer, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.fss_chat_d_read_id_u_status(p_ss_chat_d_id integer, p_user_id_from character varying, p_user_id_to character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.ss_chat_d_read_id set               
               is_read = true	 
        WHERE user_id_to = p_user_id_to
        AND ss_chat_d_id = p_ss_chat_d_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fss_chat_d_read_id_u_status(p_ss_chat_d_id integer, p_user_id_from character varying, p_user_id_to character varying);
       public       postgres    false            �           1255    209927    fss_chat_d_s(integer, integer)    FUNCTION     b  CREATE FUNCTION public.fss_chat_d_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(ss_chat_d_id integer, ss_chat_h_id integer, chat_text character varying, chat_date timestamp without time zone, user_id_from character varying, user_id_to character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.ss_chat_d_id,
               a.ss_chat_h_id,
               a.chat_text,
               a.chat_date,
               a.user_id_from,
               a.user_id_to,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.ss_chat_d_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM ss_chat_d a 
          WHERE a.ss_chat_d_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 P   DROP FUNCTION public.fss_chat_d_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209925 �   fss_chat_d_u(integer, integer, character varying, timestamp without time zone, character varying, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fss_chat_d_u(p_ss_chat_d_id integer, p_ss_chat_h_id integer, p_chat_text character varying, p_chat_date timestamp without time zone, p_user_id_from character varying, p_user_id_to character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.ss_chat_d set
               ss_chat_h_id = p_ss_chat_h_id,
               chat_text = p_chat_text,
               chat_date = p_chat_date,
               user_id_from = p_user_id_from,
               user_id_to = p_user_id_to,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND ss_chat_d_id = p_ss_chat_d_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
   DROP FUNCTION public.fss_chat_d_u(p_ss_chat_d_id integer, p_ss_chat_h_id integer, p_chat_text character varying, p_chat_date timestamp without time zone, p_user_id_from character varying, p_user_id_to character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    209963     fss_chat_d_u_chatstatus(integer)    FUNCTION     k  CREATE FUNCTION public.fss_chat_d_u_chatstatus(p_ss_chat_d_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.ss_chat_d set
             is_read = true 
        WHERE ss_chat_d_id = p_ss_chat_d_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 F   DROP FUNCTION public.fss_chat_d_u_chatstatus(p_ss_chat_d_id integer);
       public       postgres    false            e           1255    209934    fss_chat_h_d(integer, integer)    FUNCTION     u  CREATE FUNCTION public.fss_chat_h_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM ss_chat_h
    WHERE xmin::text::integer = p_lastupdatestamp   
		and ss_chat_h_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 P   DROP FUNCTION public.fss_chat_h_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209964 �   fss_chat_h_i(integer, integer, character varying, character varying, character varying, timestamp without time zone, character varying, character varying, character varying)    FUNCTION     Q  CREATE FUNCTION public.fss_chat_h_i(p_ss_portfolio_id integer, p_ss_subportfolio_id integer, p_subject character varying, p_user_id_from character varying, p_user_id_to character varying, p_doc_date timestamp without time zone, p_doc_type character varying, p_doc_no character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.ss_chat_h
    (
          ss_portfolio_id, 
          ss_subportfolio_id, 
          subject, 
          user_id_from,
          user_id_to, 
          doc_date, 
          doc_type, 
          doc_no, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_portfolio_id,
          p_ss_subportfolio_id,
          p_subject,
          p_user_id_from,
          p_user_id_to,
          p_doc_date,
          p_doc_type,
          p_doc_no,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('ss_chat_h', 'ss_chat_h_id'))::integer as row_id;
end;
$$;
 =  DROP FUNCTION public.fss_chat_h_i(p_ss_portfolio_id integer, p_ss_subportfolio_id integer, p_subject character varying, p_user_id_from character varying, p_user_id_to character varying, p_doc_date timestamp without time zone, p_doc_type character varying, p_doc_no character varying, p_user_input character varying);
       public       postgres    false            �           1255    209935    fss_chat_h_s(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fss_chat_h_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(ss_chat_h_id integer, ss_portfolio_id integer, ss_subportfolio_id integer, subject character varying, user_id character varying, doc_date timestamp without time zone, doc_type character varying, doc_no character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.ss_chat_h_id,
               a.ss_portfolio_id,
               a.ss_subportfolio_id,
               a.subject,
               a.user_id,
               a.doc_date,
               a.doc_type,
               a.doc_no,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.ss_chat_h_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM ss_chat_h a 
          WHERE a.ss_chat_h_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 P   DROP FUNCTION public.fss_chat_h_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209933 �   fss_chat_h_u(integer, integer, integer, character varying, character varying, timestamp without time zone, character varying, character varying, integer, character varying)    FUNCTION     
  CREATE FUNCTION public.fss_chat_h_u(p_ss_chat_h_id integer, p_ss_portfolio_id integer, p_ss_subportfolio_id integer, p_subject character varying, p_user_id character varying, p_doc_date timestamp without time zone, p_doc_type character varying, p_doc_no character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.ss_chat_h set
               ss_portfolio_id = p_ss_portfolio_id,
               ss_subportfolio_id = p_ss_subportfolio_id,
               subject = p_subject,
               user_id = p_user_id,
               doc_date = p_doc_date,
               doc_type = p_doc_type,
               doc_no = p_doc_no,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND ss_chat_h_id = p_ss_chat_h_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 J  DROP FUNCTION public.fss_chat_h_u(p_ss_chat_h_id integer, p_ss_portfolio_id integer, p_ss_subportfolio_id integer, p_subject character varying, p_user_id character varying, p_doc_date timestamp without time zone, p_doc_type character varying, p_doc_no character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    209513    fss_city_d(integer, integer)    FUNCTION     w  CREATE FUNCTION public.fss_city_d(p_ss_city_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM ss_city
    WHERE xmin::text::integer = p_lastupdatestamp   
		and ss_city_id = p_ss_city_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 R   DROP FUNCTION public.fss_city_d(p_ss_city_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209511 B   fss_city_i(integer, integer, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.fss_city_i(p_ss_province_id integer, p_ss_portfolio_id integer, p_descs character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.ss_city
    (
          ss_province_id, 
          ss_portfolio_id, 
          descs, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_province_id,
          p_ss_portfolio_id,
          p_descs,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('ss_city', 'ss_city_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fss_city_i(p_ss_province_id integer, p_ss_portfolio_id integer, p_descs character varying, p_user_input character varying);
       public       postgres    false            �           1255    209514    fss_city_s(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fss_city_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(ss_city_id integer, ss_province_id integer, ss_portfolio_id integer, descs character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.ss_city_id,
               a.ss_province_id,
               a.ss_portfolio_id,
               a.descs,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.ss_city_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM ss_city a 
          WHERE a.ss_city_id = p_row_id
			and  a.xmin::text::integer = p_lastupdatestamp    
;
	 	  
END;
$$;
 N   DROP FUNCTION public.fss_city_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209512 T   fss_city_u(integer, integer, integer, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fss_city_u(p_ss_city_id integer, p_ss_province_id integer, p_ss_portfolio_id integer, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.ss_city set
               ss_province_id = p_ss_province_id,
               ss_portfolio_id = p_ss_portfolio_id,
               descs = p_descs,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND ss_city_id = p_ss_city_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fss_city_u(p_ss_city_id integer, p_ss_province_id integer, p_ss_portfolio_id integer, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            {           1255    209493    fss_country_d(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fss_country_d(p_ss_country_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM ss_country
    WHERE xmin::text::integer = p_lastupdatestamp   
		and ss_country_id = p_ss_country_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 X   DROP FUNCTION public.fss_country_d(p_ss_country_id integer, p_lastupdatestamp integer);
       public       postgres    false            y           1255    209491 b   fss_country_i(integer, character varying, character varying, character varying, character varying)    FUNCTION     !  CREATE FUNCTION public.fss_country_i(p_ss_portfolio_id integer, p_short_descs character varying, p_descs character varying, p_user_input character varying, p_phone_country_code character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.ss_country
    (
          ss_portfolio_id, 
          short_descs, 
          descs, 
          user_input, 
          user_edit, 
          phone_country_code
    )
  VALUES (
          p_ss_portfolio_id,
          p_short_descs,
          p_descs,
          p_user_input,
          p_user_input,
          p_phone_country_code
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('ss_country', 'ss_country_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fss_country_i(p_ss_portfolio_id integer, p_short_descs character varying, p_descs character varying, p_user_input character varying, p_phone_country_code character varying);
       public       postgres    false            |           1255    209494    fss_country_s(integer, integer)    FUNCTION     1  CREATE FUNCTION public.fss_country_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(ss_country_id integer, ss_portfolio_id integer, short_descs character varying, descs character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, phone_country_code character varying, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.ss_country_id,
               a.ss_portfolio_id,
               a.short_descs,
               a.descs,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.phone_country_code,
               a.ss_country_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM ss_country a 
          WHERE a.ss_country_id = p_row_id 
          and  a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 Q   DROP FUNCTION public.fss_country_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            z           1255    209492 t   fss_country_u(integer, integer, character varying, character varying, integer, character varying, character varying)    FUNCTION     L  CREATE FUNCTION public.fss_country_u(p_ss_country_id integer, p_ss_portfolio_id integer, p_short_descs character varying, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying, p_phone_country_code character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.ss_country set
               ss_portfolio_id = p_ss_portfolio_id,
               short_descs = p_short_descs,
               descs = p_descs,
               user_edit = p_user_edit,
               time_edit = now()::timestamp ,
               phone_country_code = p_phone_country_code	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND ss_country_id = p_ss_country_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fss_country_u(p_ss_country_id integer, p_ss_portfolio_id integer, p_short_descs character varying, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying, p_phone_country_code character varying);
       public       postgres    false            u           1255    209133 ^   fss_define_column_i(character varying, character varying, integer, numeric, character varying)    FUNCTION     v  CREATE FUNCTION public.fss_define_column_i(p_option_url character varying, p_user_id character varying, p_subportfolio_id integer, p_line_no numeric, p_column_field character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
declare v_option_url integer; 
begin 
         



		delete from "ss_define_column"
        where "user_id" = "p_user_id"
        and "subportfolio_id" = "p_subportfolio_id"
        and "option_url" = p_option_url
        and "line_no" = "p_line_no";

	
    insert into 
    public."ss_define_column"
    (
      "user_id",  "subportfolio_id",
      "option_url",  "line_no",  "column_field",
      "user_input",  "user_edit"
    )
  values (
   		"p_user_id",		"p_subportfolio_id",
        p_option_url,	"p_line_no",			"p_column_field",
        "p_user_id",		"p_user_id"
  		);
    
return "p_option_url";
end;
$$;
 �   DROP FUNCTION public.fss_define_column_i(p_option_url character varying, p_user_id character varying, p_subportfolio_id integer, p_line_no numeric, p_column_field character varying);
       public       postgres    false            �           1255    209505     fss_district_d(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fss_district_d(p_ss_district_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM ss_district
    WHERE xmin::text::integer = p_lastupdatestamp   
		and ss_district_id = p_ss_district_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 Z   DROP FUNCTION public.fss_district_d(p_ss_district_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209503 F   fss_district_i(integer, integer, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.fss_district_i(p_ss_city_id integer, p_ss_portfolio_id integer, p_descs character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.ss_district
    (
          ss_city_id, 
          ss_portfolio_id, 
          descs, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_city_id,
          p_ss_portfolio_id,
          p_descs,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('ss_district', 'ss_district_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fss_district_i(p_ss_city_id integer, p_ss_portfolio_id integer, p_descs character varying, p_user_input character varying);
       public       postgres    false            �           1255    209506     fss_district_s(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fss_district_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(ss_district_id integer, ss_city_id integer, ss_portfolio_id integer, descs character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.ss_district_id,
               a.ss_city_id,
               a.ss_portfolio_id,
               a.descs,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.ss_district_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM ss_district a 
          WHERE a.ss_district_id = p_row_id
			and  a.xmin::text::integer = p_lastupdatestamp   
;
	 	  
END;
$$;
 R   DROP FUNCTION public.fss_district_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    209504 X   fss_district_u(integer, integer, integer, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fss_district_u(p_ss_district_id integer, p_ss_city_id integer, p_ss_portfolio_id integer, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.ss_district set
               ss_city_id = p_ss_city_id,
               ss_portfolio_id = p_ss_portfolio_id,
               descs = p_descs,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND ss_district_id = p_ss_district_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fss_district_u(p_ss_district_id integer, p_ss_city_id integer, p_ss_portfolio_id integer, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false                       1255    210956 $   fss_get_user_info(character varying)    FUNCTION     F  CREATE FUNCTION public.fss_get_user_info(p_user_id character varying) RETURNS TABLE(role character varying, user_name character varying, job_title character varying, email character varying, hand_phone character varying, portfolio_id integer, subportfolio_id integer, time_edit timestamp without time zone, file_name character varying, path_file character varying, address character varying, notes character varying, row_id integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               b.descs AS role,
               a.user_name,
               a.job_title,
               a.email,
               a.hand_phone,
               a.portfolio_id,
               a.subportfolio_id,
               a.time_edit,
               a.file_name,
               a.path_file,
               a.address,
               a.notes,
               a.ss_user_id as row_id 
          FROM ss_user a 
          JOIN ss_group b ON a.ss_group_id = b.ss_group_id
          WHERE a.user_id = p_user_id   
;
	 	  
END;
$$;
 E   DROP FUNCTION public.fss_get_user_info(p_user_id character varying);
       public       postgres    false            �           1255    210215    fss_group_d(integer, integer)    FUNCTION     r  CREATE FUNCTION public.fss_group_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM ss_group
    WHERE xmin::text::integer = p_lastupdatestamp   
		and ss_group_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 O   DROP FUNCTION public.fss_group_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210213 `   fss_group_i(integer, character varying, character varying, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.fss_group_i(p_ss_portfolio_id integer, p_descs character varying, p_short_descs character varying, p_user_type character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.ss_group
    (
          ss_portfolio_id, 
          descs, 
          short_descs, 
          user_type, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_portfolio_id,
          p_descs,
          p_short_descs,
          p_user_type,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('ss_group', 'ss_group_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fss_group_i(p_ss_portfolio_id integer, p_descs character varying, p_short_descs character varying, p_user_type character varying, p_user_input character varying);
       public       postgres    false            �           1255    210216    fss_group_s(integer, integer)    FUNCTION       CREATE FUNCTION public.fss_group_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(ss_group_id integer, ss_portfolio_id integer, descs character varying, short_descs character varying, user_type character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.ss_group_id,
               a.ss_portfolio_id,
               a.descs,
               a.short_descs,
               a.user_type,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.ss_group_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM ss_group a 
          WHERE a.ss_group_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 O   DROP FUNCTION public.fss_group_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210214 r   fss_group_u(integer, integer, character varying, character varying, character varying, integer, character varying)    FUNCTION     '  CREATE FUNCTION public.fss_group_u(p_ss_group_id integer, p_ss_portfolio_id integer, p_descs character varying, p_short_descs character varying, p_user_type character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.ss_group set
               ss_portfolio_id = p_ss_portfolio_id,
               descs = p_descs,
               short_descs = p_short_descs,
               user_type = p_user_type,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND ss_group_id = p_ss_group_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fss_group_u(p_ss_group_id integer, p_ss_portfolio_id integer, p_descs character varying, p_short_descs character varying, p_user_type character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210278 k   fss_menu_group_i(integer, integer, integer, boolean, boolean, boolean, boolean, boolean, character varying)    FUNCTION     4  CREATE FUNCTION public.fss_menu_group_i(p_ss_portfolio_id integer, p_ss_menu_id integer, p_ss_group_id integer, p_add_status boolean, p_edit_status boolean, p_delete_status boolean, p_view_status boolean, p_post_status boolean, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.ss_menu_group
    (
          ss_portfolio_id, 
          ss_menu_id, 
          ss_group_id, 
          add_status, 
          edit_status, 
          delete_status, 
          view_status, 
          post_status, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_portfolio_id,
          p_ss_menu_id,
          p_ss_group_id,
          p_add_status,
          p_edit_status,
          p_delete_status,
          p_view_status,
          p_post_status,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('ss_menu_group', 'ss_menu_group_id'))::integer as row_id;
end;
$$;
   DROP FUNCTION public.fss_menu_group_i(p_ss_portfolio_id integer, p_ss_menu_id integer, p_ss_group_id integer, p_add_status boolean, p_edit_status boolean, p_delete_status boolean, p_view_status boolean, p_post_status boolean, p_user_input character varying);
       public       postgres    false            �           1255    209134 !   fss_menu_list_s(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fss_menu_list_s(p_portfolio_id integer, p_group_id integer) RETURNS TABLE(ss_menu_id integer, title character varying, menu_url character varying, menu_type character varying, parent_menu_id integer, icon_class character varying, order_seq integer, level integer, ipath integer, add_status boolean, edit_status boolean, delete_status boolean)
    LANGUAGE plpgsql
    AS $$
begin
	return query

  SELECT ct.ss_menu_id,ct.title,ct.menu_url,ct.menu_type,ct.parent_menu_id,ct.icon_class,ct.order_seq,ct.level_no,
  (row_number()OVER(PARTITION BY ct.parent_menu_id order by ct.order_seq)::varchar||ct.level_no::"varchar"||ct.order_seq::varchar)::integer as ipath,
  smg.add_status,smg.edit_status,smg.delete_status
  FROM ss_menu ct
  inner join ss_menu_group smg on ct.ss_menu_id = smg.ss_menu_id
  where smg.ss_portfolio_id = p_portfolio_id
  and smg.ss_group_id = p_group_id
  order by ipath;
end;
$$;
 R   DROP FUNCTION public.fss_menu_list_s(p_portfolio_id integer, p_group_id integer);
       public       postgres    false            c           1255    209135 =   fss_menu_sort_u(integer, integer, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fss_menu_sort_u(p_menu_id integer, p_parent_menu_id integer, p_order_seq integer, p_user_edit character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_count integer;
BEGIN
	update public.ss_menu set
    order_seq= p_order_seq,
    user_edit= p_user_edit
    where ss_menu_id = p_menu_id 
    and parent_menu_id = p_parent_menu_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
	RETURN v_count;

END;
$$;
 �   DROP FUNCTION public.fss_menu_sort_u(p_menu_id integer, p_parent_menu_id integer, p_order_seq integer, p_user_edit character varying);
       public       postgres    false            d           1255    209136 w   fss_option_db_i(character varying, character varying, character varying, integer, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.fss_option_db_i(p_option_url character varying, p_method_api character varying, p_sp character varying, p_line_no integer, p_user_input character varying, p_table_name character varying DEFAULT ''::character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  			public.ss_option_db (
              option_url,  	method_api, 		sp,
              line_no,  		table_name,  		user_input,  		
              user_edit
			)
		VALUES (
	  			p_option_url,  	p_method_api, 		p_sp,
              	p_line_no,  		p_table_name,  		p_user_input,  		
              	p_user_input
			);
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fss_option_db_i(p_option_url character varying, p_method_api character varying, p_sp character varying, p_line_no integer, p_user_input character varying, p_table_name character varying);
       public       postgres    false            �           1255    209818 t   fss_option_function_i(character varying, character varying, character varying, character varying, character varying)    FUNCTION       CREATE FUNCTION public.fss_option_function_i(p_function_cd character varying, p_module_cd character varying, p_sp_name character varying, p_sp_param character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		
    INSERT INTO 
      public.ss_option_function
    (
      option_function_cd,
      module_cd,
      sp_name,
      sp_param,
      user_input,
      user_edit
    )
    VALUES (
      p_function_cd,
      p_module_cd,
      p_sp_name,
      p_sp_param,
      p_user_input,
      p_user_input
    );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('ss_option_function', 'ss_option_function_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fss_option_function_i(p_function_cd character varying, p_module_cd character varying, p_sp_name character varying, p_sp_param character varying, p_user_input character varying);
       public       postgres    false            h           1255    209469 �   fss_option_lookup_i(character varying, character varying, character varying, character varying, character varying, character varying)    FUNCTION     V  CREATE FUNCTION public.fss_option_lookup_i(p_lookup_cd character varying, p_column_db character varying, p_view_name character varying, p_source_field character varying, p_display_lookup character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		
    INSERT INTO 
      public.ss_option_lookup
    (
      option_lookup_cd,
      column_db,
      view_name,
      source_field,
      display_lookup,
      user_input,
      user_edit
    )
    VALUES (
      p_lookup_cd,
      p_column_db,
      p_view_name,
      p_source_field,
      p_display_lookup,
      p_user_input,
	  p_user_input
    );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('ss_option_lookup', 'ss_option_lookup_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fss_option_lookup_i(p_lookup_cd character varying, p_column_db character varying, p_view_name character varying, p_source_field character varying, p_display_lookup character varying, p_user_input character varying);
       public       postgres    false                       1255    209497     fss_province_d(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fss_province_d(p_ss_province_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM ss_province
    WHERE xmin::text::integer = p_lastupdatestamp   
		and ss_province_id = p_ss_province_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 Z   DROP FUNCTION public.fss_province_d(p_ss_province_id integer, p_lastupdatestamp integer);
       public       postgres    false            }           1255    209495 F   fss_province_i(integer, integer, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.fss_province_i(p_ss_country_id integer, p_ss_portfolio_id integer, p_descs character varying, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.ss_province
    (
          ss_country_id, 
          ss_portfolio_id, 
          descs, 
          user_input, 
          user_edit
    )
  VALUES (
          p_ss_country_id,
          p_ss_portfolio_id,
          p_descs,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('ss_province', 'ss_province_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fss_province_i(p_ss_country_id integer, p_ss_portfolio_id integer, p_descs character varying, p_user_input character varying);
       public       postgres    false            �           1255    209498     fss_province_s(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fss_province_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(ss_province_id integer, ss_country_id integer, ss_portfolio_id integer, descs character varying, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.ss_province_id,
               a.ss_country_id,
               a.ss_portfolio_id,
               a.descs,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.ss_province_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM ss_province a 
          WHERE a.ss_province_id = p_row_id
          and  a.xmin::text::integer = p_lastupdatestamp   
;
	 	  
END;
$$;
 R   DROP FUNCTION public.fss_province_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            ~           1255    209496 X   fss_province_u(integer, integer, integer, character varying, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.fss_province_u(p_ss_province_id integer, p_ss_country_id integer, p_ss_portfolio_id integer, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.ss_province set
               ss_country_id = p_ss_country_id,
               ss_portfolio_id = p_ss_portfolio_id,
               descs = p_descs,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND ss_province_id = p_ss_province_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fss_province_u(p_ss_province_id integer, p_ss_country_id integer, p_ss_portfolio_id integer, p_descs character varying, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            �           1255    210172 "   fss_running_no_d(integer, integer)    FUNCTION     �  CREATE FUNCTION public.fss_running_no_d(p_row_id integer, p_lastupdatestamp integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
Declare v_COUNT integer;
begin

	DELETE FROM ss_running_no
    WHERE xmin::text::integer = p_lastupdatestamp   
		and ss_running_no_id = p_row_id;
                   
    GET DIAGNOSTICS v_COUNT = ROW_COUNT; 
    
  RETURN v_COUNT;
end;
$$;
 T   DROP FUNCTION public.fss_running_no_d(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210170 n   fss_running_no_i(character varying, character varying, character varying, integer, integer, character varying)    FUNCTION     2  CREATE FUNCTION public.fss_running_no_i(p_module_cd character varying, p_form character varying, p_prepix character varying, p_digit_no integer, p_running_no integer, p_user_input character varying) RETURNS TABLE(row_id integer)
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin

  		INSERT INTO 
  public.ss_running_no
    (
          module_cd, 
          form, 
          prepix, 
          digit_no, 
          running_no, 
          user_input, 
          user_edit
    )
  VALUES (
          p_module_cd,
          p_form,
          p_prepix,
          p_digit_no,
          p_running_no,
          p_user_input,
          p_user_input
  );
    
    RETURN QUERY
    SELECT currval(pg_get_serial_sequence('ss_running_no', 'ss_running_no_id'))::integer as row_id;
end;
$$;
 �   DROP FUNCTION public.fss_running_no_i(p_module_cd character varying, p_form character varying, p_prepix character varying, p_digit_no integer, p_running_no integer, p_user_input character varying);
       public       postgres    false            �           1255    210173 "   fss_running_no_s(integer, integer)    FUNCTION     H  CREATE FUNCTION public.fss_running_no_s(p_row_id integer, p_lastupdatestamp integer) RETURNS TABLE(ss_running_no_id integer, module_cd character varying, form character varying, prepix character varying, digit_no integer, running_no integer, user_input character varying, user_edit character varying, time_input timestamp without time zone, time_edit timestamp without time zone, row_id integer, lastupdatestamp integer)
    LANGUAGE plpgsql
    AS $$
DECLARE v_id INTEGER; 
BEGIN 	
      RETURN QUERY                
          SELECT 
               a.ss_running_no_id,
               a.module_cd,
               a.form,
               a.prepix,
               a.digit_no,
               a.running_no,
               a.user_input,
               a.user_edit,
               a.time_input,
               a.time_edit,
               a.ss_running_no_id as row_id,
               a.xmin::text::integer as lastupdatestamp 
          FROM ss_running_no a 
          WHERE a.ss_running_no_id = p_row_id 
          AND a.xmin::text::integer = p_lastupdatestamp  
;
	 	  
END;
$$;
 T   DROP FUNCTION public.fss_running_no_s(p_row_id integer, p_lastupdatestamp integer);
       public       postgres    false            �           1255    210171 �   fss_running_no_u(integer, character varying, character varying, character varying, integer, integer, integer, character varying)    FUNCTION     Z  CREATE FUNCTION public.fss_running_no_u(p_ss_running_no_id integer, p_module_cd character varying, p_form character varying, p_prepix character varying, p_digit_no integer, p_running_no integer, p_lastupdatestamp integer, p_user_edit character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare v_count integer;
begin	
    
         
        UPDATE  public.ss_running_no set
               module_cd = p_module_cd,
               form = p_form,
               prepix = p_prepix,
               digit_no = p_digit_no,
               running_no = p_running_no,
               user_edit = p_user_edit,
               time_edit = now()::timestamp 	 
        WHERE xmin::text::integer = p_lastupdatestamp
        AND ss_running_no_id = p_ss_running_no_id;
    
    GET DIAGNOSTICS v_count = ROW_COUNT;
    return v_count;
end;
$$;
 �   DROP FUNCTION public.fss_running_no_u(p_ss_running_no_id integer, p_module_cd character varying, p_form character varying, p_prepix character varying, p_digit_no integer, p_running_no integer, p_lastupdatestamp integer, p_user_edit character varying);
       public       postgres    false            v           1255    209137 �  fss_user_log_i(timestamp without time zone, character varying, character varying, character varying, character varying, character varying, timestamp without time zone, timestamp without time zone, character varying, character varying, character varying, character varying, timestamp without time zone, timestamp without time zone, character varying, timestamp without time zone, character varying)    FUNCTION     �  CREATE FUNCTION public.fss_user_log_i(p_log_status timestamp without time zone, p_user_id character varying, p_user_group character varying, p_user_name character varying, p_email character varying, p_user_level character varying, p_expired_date timestamp without time zone, p_login_date timestamp without time zone, p_status_login character varying, p_is_inactive character varying, p_user_input character varying, p_user_edit character varying, p_time_input timestamp without time zone, p_time_edit timestamp without time zone, p_ip_address character varying, p_logout_date timestamp without time zone, p_token character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
declare
  v_count integer;
  "p_log_sequence_no" integer:=0;
  "p_password" varchar := '';
begin
	select coalesce(max("log_sequence_no"),0) + 1 into "p_log_sequence_no" from public."ss_user_log" ;

    if "p_log_sequence_no" = 0 then
	     "p_log_sequence_no" :=1;
    end if;
    raise notice 'calling cs_create_job(%)', "p_log_sequence_no";

	insert into public."ss_user_log" (
    	"log_status", "log_sequence_no",	"user_id", "user_group", "user_name", "password",	"email", "user_level", "expired_date",
    	"login_date", "status_login", "is_inactive", "user_input", "user_edit", "time_input",
    	"time_edit", "ip_address", "logout_date", "token"
    ) values (
		"p_log_status", "p_log_sequence_no",	"p_user_id", "p_user_group", "p_user_name", "p_password",	"p_email", "p_user_level", "p_expired_date",
    	"p_login_date", "p_status_login", "p_is_inactive", "p_user_input", "p_user_edit", "p_time_input",
    	"p_time_edit", "p_ip_address", "p_logout_date", "p_token"
    );

    get diagnostics v_count = row_count;

    return v_count;
end;
$$;
 w  DROP FUNCTION public.fss_user_log_i(p_log_status timestamp without time zone, p_user_id character varying, p_user_group character varying, p_user_name character varying, p_email character varying, p_user_level character varying, p_expired_date timestamp without time zone, p_login_date timestamp without time zone, p_status_login character varying, p_is_inactive character varying, p_user_input character varying, p_user_edit character varying, p_time_input timestamp without time zone, p_time_edit timestamp without time zone, p_ip_address character varying, p_logout_date timestamp without time zone, p_token character varying);
       public       postgres    false            �           1255    210258    get_menu_json()    FUNCTION     �  CREATE FUNCTION public.get_menu_json() RETURNS text
    LANGUAGE sql
    AS $$
 select jsonb_pretty(jsonb_agg(_menu.js_object)) result
from (
    select 
        jsonb_build_object(
            'ss_menu_id', x.ss_menu_id, 
            'title', x.title, 
            'menu_type', x.menu_type, 
            'parent_menu_id',x.parent_menu_id,
            'order_seq',x.order_seq,
            'level_no', x.level_no,
            'level_2', jsonb_agg(level_2)
        ) js_object
    from (
        select 
			t.ss_menu_id, 
            t.title, 
            t.menu_type, 
            t.parent_menu_id,
            t.order_seq,
            t.level_no, 
            jsonb_build_object(
                'ss_menu_id', s.ss_menu_id, 
                'title', s.title, 
                'menu_type', s.menu_type, 
                'parent_menu_id',s.parent_menu_id,
                'order_seq',s.order_seq,
                'level_no', s.level_no,
                'level_3',jsonb_agg(level_3)
            ) level_2
        from ss_menu t inner join ss_menu s 
        	on s.parent_menu_id = t.ss_menu_id
            AND s.parent_menu_id<>0
        LEFT JOIN(
           SELECT  
                    b.ss_menu_id,   
                    b.title,
                    b.menu_type,
                    b.parent_menu_id,
                    b.order_seq,
                    b.level_no
                FROM ss_menu b
                where b.parent_menu_id<>0
                group by b.ss_menu_id,b.parent_menu_id
        ) level_3 ON(level_3.parent_menu_id = s.ss_menu_id)
        where t.parent_menu_id = 0
/*        order by t.level_no,t.order_seq*/
        group by t.ss_menu_id,t.title,t.menu_type,t.parent_menu_id,t.order_seq,t.level_no,
         s.ss_menu_id,s.title,s.menu_type,s.parent_menu_id,s.order_seq,s.level_no
        ) x
    group by x.ss_menu_id,x.title,x.menu_type,x.parent_menu_id,x.order_seq,x.level_no
    ) _menu;
$$;
 &   DROP FUNCTION public.get_menu_json();
       public       postgres    false            �           1255    210277 %   get_menu_json_group(integer, integer)    FUNCTION     �  CREATE FUNCTION public.get_menu_json_group(p_ss_portfolio_id integer, p_ss_group_id integer) RETURNS text
    LANGUAGE sql
    AS $$
 select jsonb_pretty(jsonb_agg(_menu.js_object)) result
from (
    select 
        jsonb_build_object(
            'ss_menu_id', x.ss_menu_id, 
            'title', x.title, 
            'menu_type', x.menu_type, 
            'parent_menu_id',x.parent_menu_id,
            'order_seq',x.order_seq,
            'level_no', x.level_no,
            'is_check', x.is_check,
            'add_status',x.add_status,
            'edit_status',x.edit_status,
            'delete_status',x.delete_status,
            'post_status',x.post_status,
            'view_status',x.view_status,
            'level_2', case when count(level_2) = 0 then null else COALESCE(jsonb_agg(level_2),null) end--jsonb_agg(level_2)
        ) js_object
    from (
        select 
			t.ss_menu_id, 
            t.title, 
            t.menu_type, 
            t.parent_menu_id,
            t.order_seq,
            t.level_no, 
            case WHEN g.ss_menu_group_id is null THEN
            FALSE
            else TRUE
            end as is_check,
            g.add_status,
            g.edit_status,
            g.delete_status,
            g.post_status,
            g.view_status,
            jsonb_build_object(
                'ss_menu_id', s.ss_menu_id, 
                'title', s.title, 
                'menu_type', s.menu_type, 
                'parent_menu_id',s.parent_menu_id,
                'order_seq',s.order_seq,
                'level_no', s.level_no,
                'is_check', case WHEN g2.ss_menu_group_id is null THEN FALSE else TRUE end,
                'add_status',g2.add_status,
                'edit_status',g2.edit_status,
                'delete_status',g2.delete_status,
                'post_status',g2.post_status,
                'view_status',g2.view_status,
                'level_3',case when count(level_3) = 0 then NULL else jsonb_agg(level_3) END--jsonb_agg(level_3)
            ) level_2
        from ss_menu t inner join ss_menu s 
        	on s.parent_menu_id = t.ss_menu_id
            AND s.parent_menu_id<>0
        left join ss_menu_group g 
        	ON g.ss_menu_id = t.ss_menu_id
            AND g.ss_portfolio_id = p_ss_portfolio_id
            AND g.ss_group_id = p_ss_group_id
        left join ss_menu_group g2 
        	ON g2.ss_menu_id = s.ss_menu_id
            AND g2.ss_portfolio_id = p_ss_portfolio_id
            AND g2.ss_group_id = p_ss_group_id
        LEFT JOIN(
           SELECT  
                    b.ss_menu_id,   
                    b.title,
                    b.menu_type,
                    b.parent_menu_id,
                    b.order_seq,
                    b.level_no,
                    case WHEN g3.ss_menu_group_id is null THEN
                    FALSE
                    else TRUE
                    end as is_check,
                    g3.add_status,
                    g3.edit_status,
                    g3.delete_status,
                    g3.post_status,
                    g3.view_status
                FROM ss_menu b left join ss_menu_group g3 
        			ON g3.ss_menu_id = b.ss_menu_id
            		AND g3.ss_portfolio_id = p_ss_portfolio_id
            		AND g3.ss_group_id = p_ss_group_id
                where b.parent_menu_id<>0
                group by b.ss_menu_id,b.parent_menu_id,
                g3.ss_menu_group_id,g3.add_status, g3.edit_status, g3.delete_status, g3.post_status, g3.view_status
        ) level_3 ON(level_3.parent_menu_id = s.ss_menu_id)
        where t.parent_menu_id = 0
/*        order by t.level_no,t.order_seq*/
        group by t.ss_menu_id,t.title,t.menu_type,t.parent_menu_id,t.order_seq,t.level_no,
         s.ss_menu_id,s.title,s.menu_type,s.parent_menu_id,s.order_seq,s.level_no,
         g.ss_menu_group_id,g.add_status, g.edit_status,g.delete_status,g.post_status,g.view_status ,
         g2.ss_menu_group_id,g2.add_status, g2.edit_status,g2.delete_status,g2.post_status,g2.view_status 
        ) x
    group by x.ss_menu_id,x.title,x.menu_type,x.parent_menu_id,x.order_seq,x.level_no,x.is_check,
		x.add_status, x.edit_status, x.delete_status, x.post_status, x.view_status
    ) _menu;
$$;
 \   DROP FUNCTION public.get_menu_json_group(p_ss_portfolio_id integer, p_ss_group_id integer);
       public       postgres    false            w           1255    209138 %   get_param_function(character varying)    FUNCTION     .  CREATE FUNCTION public.get_param_function(function_name character varying) RETURNS TABLE(routine_name information_schema.sql_identifier, parameter_name information_schema.sql_identifier, data_type information_schema.character_data, oridinal_position information_schema.cardinal_number)
    LANGUAGE plpgsql
    AS $$
-- DECLARE function_name varchar(255);
BEGIN
--   	SELECT function INTO function_name
--     FROM public."PosApi"
--     WHERE api = api_name;

    RETURN QUERY

  	SELECT routines.routine_name,
  	       parameters.parameter_name,
  	       parameters.data_type,
  	       parameters.ordinal_position
		FROM information_schema.routines
			LEFT JOIN information_schema.parameters ON routines.specific_name = parameters.specific_name
		WHERE
					routines.specific_catalog = current_database() AND
					routines.specific_schema = 'public' AND
					routines.routine_name iLIKE function_name AND
		      parameters.parameter_mode = 'IN'
		ORDER BY routines.specific_name, routines.routine_name, parameters.ordinal_position;

END
$$;
 J   DROP FUNCTION public.get_param_function(function_name character varying);
       public       postgres    false            �           1255    210182 4   get_running_no(character varying, character varying)    FUNCTION     @  CREATE FUNCTION public.get_running_no(p_module_cd character varying, p_table_name character varying) RETURNS TABLE(doc_no character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE v_prepix varchar;v_digit_no integer;v_running_no integer; v_doc_no varchar = ''; 
   counter INTEGER := 0 ; v_ldigit_no varchar = '';
BEGIN 	

	IF EXISTS(select 1 from ss_running_no x where x.module_cd ILIKE p_module_cd and x.form ILIKE p_table_name) THEN
        select a.prepix ,a.digit_no, a.running_no
        into   v_prepix, v_digit_no, v_running_no    
        from ss_running_no a
        where a.module_cd ILIKE p_module_cd
        and a.form ILIKE p_table_name;
        
        update ss_running_no
        set running_no = running_no +1
        where module_cd ILIKE p_module_cd
        and form ILIKE p_table_name;
    else
    	RAISE EXCEPTION 'Generate No Failed, PLEASE CHECK YOUR SETTING RUNNING NO !' 
			 USING HINT = 'Check again';
    END IF;
	
    LOOP 
		EXIT WHEN counter = v_digit_no ; 
		counter := counter + 1 ; 
        v_ldigit_no := v_ldigit_no||'0';
	END LOOP ; 
    v_digit_no := ('1'||v_ldigit_no::varchar)::INTEGER + v_running_no;
	v_doc_no := v_prepix||SUBSTRING(v_digit_no::"varchar",2);

      RETURN QUERY                
          SELECT v_doc_no as doc_no
               
;
	 	  
END;
$$;
 d   DROP FUNCTION public.get_running_no(p_module_cd character varying, p_table_name character varying);
       public       postgres    false            �            1259    209570 
   cm_contact    TABLE       CREATE TABLE public.cm_contact (
    cm_contact_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    contact_type character(1) DEFAULT 'N'::bpchar NOT NULL,
    contact_status character(1) NOT NULL,
    contact_created timestamp(0) without time zone DEFAULT now() NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(255),
    ss_country_id integer,
    ss_province_id integer,
    ss_city_id integer,
    ss_district_id integer,
    phone_no character varying(20),
    email character varying(60),
    website character varying(60),
    contact_person character varying(100) NOT NULL,
    contact_phone_no character varying(20),
    file_name character varying(100),
    path_file character varying(150),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    cm_customer_status_id integer,
    marketing_id character varying(20)
);
    DROP TABLE public.cm_contact;
       public         postgres    false            �            1259    209568    cm_contact2_cm_contact_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cm_contact2_cm_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.cm_contact2_cm_contact_id_seq;
       public       postgres    false    243                       0    0    cm_contact2_cm_contact_id_seq    SEQUENCE OWNED BY     ^   ALTER SEQUENCE public.cm_contact2_cm_contact_id_seq OWNED BY public.cm_contact.cm_contact_id;
            public       postgres    false    242                       1259    209970    cm_contact_person    TABLE       CREATE TABLE public.cm_contact_person (
    cm_contact_person_id integer NOT NULL,
    cm_contact_id integer NOT NULL,
    name character varying(100) NOT NULL,
    phone_no character varying(20),
    email character varying(60),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    "position" character varying(100),
    descs character varying(255)
);
 %   DROP TABLE public.cm_contact_person;
       public         postgres    false                       1259    209968 *   cm_contact_person_cm_contact_person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cm_contact_person_cm_contact_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.cm_contact_person_cm_contact_person_id_seq;
       public       postgres    false    268                       0    0 *   cm_contact_person_cm_contact_person_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.cm_contact_person_cm_contact_person_id_seq OWNED BY public.cm_contact_person.cm_contact_person_id;
            public       postgres    false    267            3           1259    210436    cm_customer_status    TABLE     �  CREATE TABLE public.cm_customer_status (
    cm_customer_status_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    descs character varying(100) NOT NULL,
    user_input character varying(20) NOT NULL,
    user_edit character varying(20) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    customer_status_cd character varying(20),
    customer_status_colour character varying(20)
);
 &   DROP TABLE public.cm_customer_status;
       public         postgres    false            2           1259    210434 ,   cm_customer_status_cm_customer_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cm_customer_status_cm_customer_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.cm_customer_status_cm_customer_status_id_seq;
       public       postgres    false    307                       0    0 ,   cm_customer_status_cm_customer_status_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.cm_customer_status_cm_customer_status_id_seq OWNED BY public.cm_customer_status.cm_customer_status_id;
            public       postgres    false    306            1           1259    210426    cm_customer_status_dtl    TABLE     �  CREATE TABLE public.cm_customer_status_dtl (
    cm_customer_status_dtl_id integer NOT NULL,
    cm_customer_status_id integer NOT NULL,
    action character varying(100) NOT NULL,
    month integer,
    freq integer,
    user_input character varying(20) NOT NULL,
    user_edit character varying(20) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    action_type character(1) NOT NULL
);
 *   DROP TABLE public.cm_customer_status_dtl;
       public         postgres    false            0           1259    210424 3   cm_customer_status_dtl_cm_customer_status_dt_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cm_customer_status_dtl_cm_customer_status_dt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.cm_customer_status_dtl_cm_customer_status_dt_id_seq;
       public       postgres    false    305                       0    0 3   cm_customer_status_dtl_cm_customer_status_dt_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.cm_customer_status_dtl_cm_customer_status_dt_id_seq OWNED BY public.cm_customer_status_dtl.cm_customer_status_dtl_id;
            public       postgres    false    304            �            1259    209139    ss_portfolio    TABLE       CREATE TABLE public.ss_portfolio (
    ss_portfolio_id integer NOT NULL,
    name character varying(100) NOT NULL,
    short_name character varying(60) NOT NULL,
    reference_no character varying(60),
    address character varying(255),
    city character varying(60),
    post_cd character varying(10),
    phone_no character varying(60),
    fax_no character varying(60),
    website character varying(100),
    rounding_factor integer,
    remarks text,
    picture_file_name character varying(60),
    reference_file_name character varying(255),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
     DROP TABLE public.ss_portfolio;
       public         postgres    false            �            1259    209147     cm_portfolio_cm_portfolio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cm_portfolio_cm_portfolio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.cm_portfolio_cm_portfolio_id_seq;
       public       postgres    false    196                       0    0     cm_portfolio_cm_portfolio_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.cm_portfolio_cm_portfolio_id_seq OWNED BY public.ss_portfolio.ss_portfolio_id;
            public       postgres    false    197            �            1259    209857 	   cm_reason    TABLE     �  CREATE TABLE public.cm_reason (
    cm_reason_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    module_cd character varying(3) NOT NULL,
    reason_cd character varying(10) NOT NULL,
    descs character varying(255),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.cm_reason;
       public         postgres    false            �            1259    209855    cm_reason_cm_reason_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cm_reason_cm_reason_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.cm_reason_cm_reason_id_seq;
       public       postgres    false    254                       0    0    cm_reason_cm_reason_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.cm_reason_cm_reason_id_seq OWNED BY public.cm_reason.cm_reason_id;
            public       postgres    false    253            �            1259    209149    ss_subportfolio    TABLE     C  CREATE TABLE public.ss_subportfolio (
    ss_subportfolio_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    name character varying(100) NOT NULL,
    short_name character varying(20) NOT NULL,
    subportfolio_start timestamp(0) without time zone,
    internal_contact_id character varying(20),
    reference_no character varying(60),
    address character varying(255) NOT NULL,
    city character varying(60),
    post_cd character varying(10),
    phone_no character varying(60),
    fax_no character varying(60),
    tax_address character varying(255),
    tax_city character varying(60),
    tax_post_cd character varying(10),
    tax_registration_no character varying(30),
    tax_registration_date timestamp(0) without time zone,
    tax_reference_no character varying(60),
    standard_tax_running_cd character varying(5),
    common_tax_running_cd character varying(5),
    ar_withholding_tax_running_cd character varying(5),
    ap_withholding_deduction_running_cd character varying(5),
    ap_vat_deduction_running_cd character varying(5),
    default_vat_charges_assignment character varying(1),
    hold_withholding character varying(1),
    hold_vat character varying(1),
    remarks text,
    picture_file_name character varying(60),
    reference_file_name character varying(255),
    website character varying(60),
    email character varying(60),
    url_picture_map character varying(255),
    map_file_name character varying(100),
    ref_map_file_name character varying(100),
    coordinate character varying(1000),
    latitude character varying(100),
    longitude character varying(100),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 #   DROP TABLE public.ss_subportfolio;
       public         postgres    false            �            1259    209157 *   cm_subportfolio_new_cm_subportfolio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cm_subportfolio_new_cm_subportfolio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.cm_subportfolio_new_cm_subportfolio_id_seq;
       public       postgres    false    198                       0    0 *   cm_subportfolio_new_cm_subportfolio_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.cm_subportfolio_new_cm_subportfolio_id_seq OWNED BY public.ss_subportfolio.ss_subportfolio_id;
            public       postgres    false    199            &           1259    210301 	   fm_driver    TABLE     -  CREATE TABLE public.fm_driver (
    fm_driver_id integer NOT NULL,
    driver_name character varying(60) NOT NULL,
    handphone character varying(30) NOT NULL,
    address character varying(255) NOT NULL,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    driver_status character varying(1) DEFAULT 'A'::character varying NOT NULL,
    remarks character varying(1000)
);
    DROP TABLE public.fm_driver;
       public         postgres    false            (           1259    210311    fm_driver_doc    TABLE     h  CREATE TABLE public.fm_driver_doc (
    fm_driver_doc_id integer NOT NULL,
    fm_driver_id integer,
    doc_type character varying(1),
    doc_no character varying(30),
    doc_file_name character varying(100),
    doc_path_file character varying(150),
    expiry_date timestamp(0) without time zone,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    driver_status character varying(1) DEFAULT 'A'::character varying NOT NULL
);
 !   DROP TABLE public.fm_driver_doc;
       public         postgres    false            '           1259    210309 "   fm_driver_doc_fm_driver_doc_id_seq    SEQUENCE     �   CREATE SEQUENCE public.fm_driver_doc_fm_driver_doc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.fm_driver_doc_fm_driver_doc_id_seq;
       public       postgres    false    296                       0    0 "   fm_driver_doc_fm_driver_doc_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.fm_driver_doc_fm_driver_doc_id_seq OWNED BY public.fm_driver_doc.fm_driver_doc_id;
            public       postgres    false    295            %           1259    210299    fm_driver_fm_driver_id_seq    SEQUENCE     �   CREATE SEQUENCE public.fm_driver_fm_driver_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.fm_driver_fm_driver_id_seq;
       public       postgres    false    294                       0    0    fm_driver_fm_driver_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.fm_driver_fm_driver_id_seq OWNED BY public.fm_driver.fm_driver_id;
            public       postgres    false    293            "           1259    210281    fm_fleet_mstr    TABLE     u  CREATE TABLE public.fm_fleet_mstr (
    fm_fleet_mstr_id integer NOT NULL,
    license_plate_no character varying(20) NOT NULL,
    fm_fleet_type_id integer NOT NULL,
    fm_driver_id integer,
    fm_driver_id2 integer,
    descs character varying(255),
    bpkb_no character varying(20) NOT NULL,
    stnk_no character varying(20) NOT NULL,
    stnk_expiry_date timestamp(0) without time zone,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 !   DROP TABLE public.fm_fleet_mstr;
       public         postgres    false            $           1259    210291    fm_fleet_mstr_doc    TABLE     $  CREATE TABLE public.fm_fleet_mstr_doc (
    fm_fleet_mstr_doc_id integer NOT NULL,
    fm_fleet_mstr_id integer,
    doc_type character varying(1),
    doc_no character varying(30),
    doc_file_name character varying(100),
    doc_path_file character varying(150),
    expiry_date timestamp(0) without time zone,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 %   DROP TABLE public.fm_fleet_mstr_doc;
       public         postgres    false            #           1259    210289 *   fm_fleet_mstr_doc_fm_fleet_mstr_doc_id_seq    SEQUENCE     �   CREATE SEQUENCE public.fm_fleet_mstr_doc_fm_fleet_mstr_doc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.fm_fleet_mstr_doc_fm_fleet_mstr_doc_id_seq;
       public       postgres    false    292                       0    0 *   fm_fleet_mstr_doc_fm_fleet_mstr_doc_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.fm_fleet_mstr_doc_fm_fleet_mstr_doc_id_seq OWNED BY public.fm_fleet_mstr_doc.fm_fleet_mstr_doc_id;
            public       postgres    false    291            !           1259    210279 "   fm_fleet_mstr_fm_fleet_mstr_id_seq    SEQUENCE     �   CREATE SEQUENCE public.fm_fleet_mstr_fm_fleet_mstr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.fm_fleet_mstr_fm_fleet_mstr_id_seq;
       public       postgres    false    290                       0    0 "   fm_fleet_mstr_fm_fleet_mstr_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.fm_fleet_mstr_fm_fleet_mstr_id_seq OWNED BY public.fm_fleet_mstr.fm_fleet_mstr_id;
            public       postgres    false    289                       1259    210261    fm_fleet_type    TABLE     �  CREATE TABLE public.fm_fleet_type (
    fm_fleet_type_id integer NOT NULL,
    fleet_cd character varying(20) NOT NULL,
    descs character varying(150),
    file_name character varying(100),
    path_file character varying(150),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 !   DROP TABLE public.fm_fleet_type;
       public         postgres    false                       1259    210259 "   fm_fleet_type_fm_fleet_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.fm_fleet_type_fm_fleet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.fm_fleet_type_fm_fleet_type_id_seq;
       public       postgres    false    287                       0    0 "   fm_fleet_type_fm_fleet_type_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.fm_fleet_type_fm_fleet_type_id_seq OWNED BY public.fm_fleet_type.fm_fleet_type_id;
            public       postgres    false    286            �            1259    209675    mk_appointment    TABLE     �  CREATE TABLE public.mk_appointment (
    mk_appointment_id integer NOT NULL,
    cm_contact_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    action_type character(1) DEFAULT 'C'::bpchar NOT NULL,
    pic character varying(255),
    appointment_date timestamp(0) without time zone DEFAULT now() NOT NULL,
    meeting_address character varying(150),
    descs character varying(255),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    status character(1) DEFAULT 'N'::bpchar,
    cm_contact_person_id integer,
    appointment_type character(1)
);
 "   DROP TABLE public.mk_appointment;
       public         postgres    false            �            1259    209673 &   mk_appointment_2_mk_appointment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_appointment_2_mk_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.mk_appointment_2_mk_appointment_id_seq;
       public       postgres    false    246                       0    0 &   mk_appointment_2_mk_appointment_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.mk_appointment_2_mk_appointment_id_seq OWNED BY public.mk_appointment.mk_appointment_id;
            public       postgres    false    245            \           1259    210985    mk_commision_dash    TABLE     �  CREATE TABLE public.mk_commision_dash (
    mk_commision_dash_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    user_id character varying(20) NOT NULL,
    paid_amt numeric(20,4),
    overdue_amt numeric(20,4),
    pending_amt numeric(20,4),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 %   DROP TABLE public.mk_commision_dash;
       public         postgres    false            Z           1259    210975    mk_commision_dash_dt    TABLE     B  CREATE TABLE public.mk_commision_dash_dt (
    mk_commision_dash_dt_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    user_id character varying(20) NOT NULL,
    marketing_id character varying(20),
    marketing_name character varying(100),
    paid_amt numeric(20,4),
    overdue_amt numeric(20,4),
    pending_amt numeric(20,4),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 (   DROP TABLE public.mk_commision_dash_dt;
       public         postgres    false            Y           1259    210973 0   mk_commision_dash_dt_mk_commision_dash_dt_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_commision_dash_dt_mk_commision_dash_dt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.mk_commision_dash_dt_mk_commision_dash_dt_id_seq;
       public       postgres    false    346                        0    0 0   mk_commision_dash_dt_mk_commision_dash_dt_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mk_commision_dash_dt_mk_commision_dash_dt_id_seq OWNED BY public.mk_commision_dash_dt.mk_commision_dash_dt_id;
            public       postgres    false    345            [           1259    210983 *   mk_commision_dash_mk_commision_dash_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_commision_dash_mk_commision_dash_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.mk_commision_dash_mk_commision_dash_id_seq;
       public       postgres    false    348            !           0    0 *   mk_commision_dash_mk_commision_dash_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.mk_commision_dash_mk_commision_dash_id_seq OWNED BY public.mk_commision_dash.mk_commision_dash_id;
            public       postgres    false    347            6           1259    210480 
   mk_logbook    TABLE     �  CREATE TABLE public.mk_logbook (
    mk_logbook_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    cm_contact_id integer NOT NULL,
    cm_contact_person_id integer NOT NULL,
    appoinment_date timestamp(0) without time zone DEFAULT now() NOT NULL,
    logbook_date timestamp(0) without time zone DEFAULT now() NOT NULL,
    action_type character(1) DEFAULT 'C'::bpchar NOT NULL,
    meeting_address character varying(150),
    descs character varying(255),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.mk_logbook;
       public         postgres    false            5           1259    210478    mk_logbook_mk_logbook_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_logbook_mk_logbook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.mk_logbook_mk_logbook_id_seq;
       public       postgres    false    310            "           0    0    mk_logbook_mk_logbook_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.mk_logbook_mk_logbook_id_seq OWNED BY public.mk_logbook.mk_logbook_id;
            public       postgres    false    309            9           1259    210552    mk_marketing    TABLE     
  CREATE TABLE public.mk_marketing (
    mk_marketing_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    user_id character varying(20) NOT NULL,
    marketing_id character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    nik_id character varying(20),
    address character varying(255),
    email character varying(60),
    hand_phone character varying(60),
    status_active boolean,
    join_date timestamp(0) without time zone DEFAULT now() NOT NULL,
    monthly_point integer,
    monthly_new_prospect integer,
    user_input character varying(20) NOT NULL,
    user_edit character varying(20) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
     DROP TABLE public.mk_marketing;
       public         postgres    false            8           1259    210550     mk_marketing_mk_marketing_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_marketing_mk_marketing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.mk_marketing_mk_marketing_id_seq;
       public       postgres    false    313            #           0    0     mk_marketing_mk_marketing_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.mk_marketing_mk_marketing_id_seq OWNED BY public.mk_marketing.mk_marketing_id;
            public       postgres    false    312            A           1259    210713    mk_marketing_target    TABLE       CREATE TABLE public.mk_marketing_target (
    mk_marketing_target_id integer NOT NULL,
    marketing_id character varying(20) NOT NULL,
    years integer NOT NULL,
    month integer NOT NULL,
    ftl_amt numeric(20,4),
    ltl_amt numeric(20,4),
    project_amt numeric(20,4),
    rental_amt numeric(20,4),
    user_input character varying(20) NOT NULL,
    user_edit character varying(20) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 '   DROP TABLE public.mk_marketing_target;
       public         postgres    false            F           1259    210793    mk_marketing_target_dash    TABLE     �  CREATE TABLE public.mk_marketing_target_dash (
    mk_marketing_target_dash_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    user_id character varying(20) NOT NULL,
    years integer NOT NULL,
    months integer NOT NULL,
    target_amt numeric(20,4),
    achievement_amt numeric(20,4),
    display_target_amt numeric(20,4),
    display_achievement_amt numeric(20,4),
    display_satuan character varying(20) NOT NULL,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 ,   DROP TABLE public.mk_marketing_target_dash;
       public         postgres    false            H           1259    210814    mk_marketing_target_dash_dt    TABLE       CREATE TABLE public.mk_marketing_target_dash_dt (
    mk_marketing_target_dash_dt_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    user_id character varying NOT NULL,
    marketing_id character varying(20) NOT NULL,
    marketing_name character varying(100) NOT NULL,
    years integer NOT NULL,
    months integer NOT NULL,
    target_amt numeric(20,4),
    achievement_amt numeric(20,4),
    display_target_amt numeric(20,4),
    display_achievement_amt numeric(20,4),
    display_satuan character varying(20) NOT NULL,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 /   DROP TABLE public.mk_marketing_target_dash_dt;
       public         postgres    false            G           1259    210812 >   mk_marketing_target_dash_dt_mk_marketing_target_dash_dt_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_marketing_target_dash_dt_mk_marketing_target_dash_dt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 U   DROP SEQUENCE public.mk_marketing_target_dash_dt_mk_marketing_target_dash_dt_id_seq;
       public       postgres    false    328            $           0    0 >   mk_marketing_target_dash_dt_mk_marketing_target_dash_dt_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mk_marketing_target_dash_dt_mk_marketing_target_dash_dt_id_seq OWNED BY public.mk_marketing_target_dash_dt.mk_marketing_target_dash_dt_id;
            public       postgres    false    327            E           1259    210791 8   mk_marketing_target_dash_mk_marketing_target_dash_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_marketing_target_dash_mk_marketing_target_dash_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public.mk_marketing_target_dash_mk_marketing_target_dash_id_seq;
       public       postgres    false    326            %           0    0 8   mk_marketing_target_dash_mk_marketing_target_dash_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mk_marketing_target_dash_mk_marketing_target_dash_id_seq OWNED BY public.mk_marketing_target_dash.mk_marketing_target_dash_id;
            public       postgres    false    325            @           1259    210711 .   mk_marketing_target_mk_marketing_target_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_marketing_target_mk_marketing_target_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.mk_marketing_target_mk_marketing_target_id_seq;
       public       postgres    false    321            &           0    0 .   mk_marketing_target_mk_marketing_target_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mk_marketing_target_mk_marketing_target_id_seq OWNED BY public.mk_marketing_target.mk_marketing_target_id;
            public       postgres    false    320            ;           1259    210566    mk_marketing_team    TABLE     �  CREATE TABLE public.mk_marketing_team (
    mk_marketing_team_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    user_id character varying(20) NOT NULL,
    parent_marketing_id character varying(20) NOT NULL,
    child_marketing_id character varying(20) NOT NULL,
    user_input character varying(20) NOT NULL,
    user_edit character varying(20) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 %   DROP TABLE public.mk_marketing_team;
       public         postgres    false            :           1259    210564 *   mk_marketing_team_mk_marketing_team_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_marketing_team_mk_marketing_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.mk_marketing_team_mk_marketing_team_id_seq;
       public       postgres    false    315            '           0    0 *   mk_marketing_team_mk_marketing_team_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.mk_marketing_team_mk_marketing_team_id_seq OWNED BY public.mk_marketing_team.mk_marketing_team_id;
            public       postgres    false    314            K           1259    210840    mk_new_prospect_dash    TABLE     n  CREATE TABLE public.mk_new_prospect_dash (
    mk_new_prospect_dash_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    user_id character varying(20) NOT NULL,
    years integer NOT NULL,
    months integer NOT NULL,
    target_prospect numeric(20,4),
    achievement_prospect numeric(20,4),
    monthly_point_target numeric(20,4),
    monthly_point_achievement numeric(20,4),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 (   DROP TABLE public.mk_new_prospect_dash;
       public         postgres    false            M           1259    210863    mk_new_prospect_dash_dt    TABLE     �  CREATE TABLE public.mk_new_prospect_dash_dt (
    mk_new_prospect_dash_dt_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    user_id character varying(20) NOT NULL,
    years integer NOT NULL,
    months integer NOT NULL,
    marketing_id character varying(20) NOT NULL,
    marketing_name character varying(100) NOT NULL,
    target_prospect numeric(20,4),
    achievement_prospect numeric(20,4),
    monthly_point_target numeric(20,4),
    monthly_point_achievement numeric(20,4),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 +   DROP TABLE public.mk_new_prospect_dash_dt;
       public         postgres    false            L           1259    210861 6   mk_new_prospect_dash_dt_mk_new_prospect_dash_dt_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_new_prospect_dash_dt_mk_new_prospect_dash_dt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public.mk_new_prospect_dash_dt_mk_new_prospect_dash_dt_id_seq;
       public       postgres    false    333            (           0    0 6   mk_new_prospect_dash_dt_mk_new_prospect_dash_dt_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mk_new_prospect_dash_dt_mk_new_prospect_dash_dt_id_seq OWNED BY public.mk_new_prospect_dash_dt.mk_new_prospect_dash_dt_id;
            public       postgres    false    332            J           1259    210838 0   mk_new_prospect_dash_mk_new_prospect_dash_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_new_prospect_dash_mk_new_prospect_dash_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.mk_new_prospect_dash_mk_new_prospect_dash_id_seq;
       public       postgres    false    331            )           0    0 0   mk_new_prospect_dash_mk_new_prospect_dash_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mk_new_prospect_dash_mk_new_prospect_dash_id_seq OWNED BY public.mk_new_prospect_dash.mk_new_prospect_dash_id;
            public       postgres    false    330            ^           1259    210995    mk_open_order    TABLE       CREATE TABLE public.mk_open_order (
    mk_open_order_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    customer_name character varying(100) NOT NULL,
    customer_email character varying(100),
    customer_phone character varying(100),
    customer_contact_person character varying(100),
    customer_contact_phone_no character varying(100),
    order_no character varying(20) NOT NULL,
    order_date timestamp(0) without time zone NOT NULL,
    order_type character(1) NOT NULL,
    project_name character varying(255),
    descs character varying(1000),
    from_location character varying(20),
    to_location character varying(20),
    order_amt numeric(20,4),
    start_date timestamp(0) without time zone,
    end_date timestamp(0) without time zone,
    status character varying(20),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 !   DROP TABLE public.mk_open_order;
       public         postgres    false            ]           1259    210993 "   mk_open_order_mk_open_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_open_order_mk_open_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.mk_open_order_mk_open_order_id_seq;
       public       postgres    false    350            *           0    0 "   mk_open_order_mk_open_order_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.mk_open_order_mk_open_order_id_seq OWNED BY public.mk_open_order.mk_open_order_id;
            public       postgres    false    349            X           1259    210965    mk_outstanding_payment_dash    TABLE     p  CREATE TABLE public.mk_outstanding_payment_dash (
    mk_outstanding_payment_dash_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    user_id character varying(20) NOT NULL,
    cm_contact_id integer NOT NULL,
    customer_name character varying(100) NOT NULL,
    marketing_id character varying(20),
    marketing_name character varying(100),
    outstanding_amt numeric(20,4),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 /   DROP TABLE public.mk_outstanding_payment_dash;
       public         postgres    false            W           1259    210963 >   mk_outstanding_payment_dash_mk_outstanding_payment_dash_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_outstanding_payment_dash_mk_outstanding_payment_dash_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 U   DROP SEQUENCE public.mk_outstanding_payment_dash_mk_outstanding_payment_dash_id_seq;
       public       postgres    false    344            +           0    0 >   mk_outstanding_payment_dash_mk_outstanding_payment_dash_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.mk_outstanding_payment_dash_mk_outstanding_payment_dash_id_seq OWNED BY public.mk_outstanding_payment_dash.mk_outstanding_payment_dash_id;
            public       postgres    false    343            �            1259    209783    mk_quotation    TABLE     \  CREATE TABLE public.mk_quotation (
    mk_quotation_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    ss_subportfolio_id integer NOT NULL,
    cm_contact_id integer NOT NULL,
    quotation_no character varying(20) NOT NULL,
    quotation_date timestamp(0) without time zone NOT NULL,
    quotation_type character(1) NOT NULL,
    project_name character varying(60),
    descs character varying(1000),
    project_value numeric(20,4),
    expired_date timestamp(0) without time zone,
    status character(1),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    reason_cd character varying(10),
    reason_descs character varying(255),
    chat_topik_id integer
);
     DROP TABLE public.mk_quotation;
       public         postgres    false            �            1259    209781     mk_quotation_mk_quotation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_quotation_mk_quotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.mk_quotation_mk_quotation_id_seq;
       public       postgres    false    252            ,           0    0     mk_quotation_mk_quotation_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.mk_quotation_mk_quotation_id_seq OWNED BY public.mk_quotation.mk_quotation_id;
            public       postgres    false    251            ?           1259    210692    mk_spec    TABLE     �  CREATE TABLE public.mk_spec (
    ss_portfolio_id integer NOT NULL,
    action_call_point integer,
    action_visit_point integer,
    action_entertain_point integer,
    working_days_monday character(1) DEFAULT 'Y'::bpchar NOT NULL,
    working_days_tuesday character(1) DEFAULT 'Y'::bpchar NOT NULL,
    working_days_wednesday character(1) DEFAULT 'Y'::bpchar NOT NULL,
    working_days_thursday character(1) DEFAULT 'Y'::bpchar NOT NULL,
    working_days_friday character(1) DEFAULT 'Y'::bpchar NOT NULL,
    working_days_saturday character(1) DEFAULT 'N'::bpchar NOT NULL,
    working_days_sunday character(1) DEFAULT 'N'::bpchar NOT NULL,
    new_cm_customer_status_id integer,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.mk_spec;
       public         postgres    false            �            1259    209706    mk_todo_list    TABLE     �  CREATE TABLE public.mk_todo_list (
    mk_todo_list_id integer NOT NULL,
    cm_contact_id integer NOT NULL,
    action_type character varying(1) NOT NULL,
    descs character varying(255),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
     DROP TABLE public.mk_todo_list;
       public         postgres    false            �            1259    209704     mk_todo_list_mk_todo_list_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_todo_list_mk_todo_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.mk_todo_list_mk_todo_list_id_seq;
       public       postgres    false    248            -           0    0     mk_todo_list_mk_todo_list_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.mk_todo_list_mk_todo_list_id_seq OWNED BY public.mk_todo_list.mk_todo_list_id;
            public       postgres    false    247            O           1259    210882    mk_trx_logbook    TABLE     �  CREATE TABLE public.mk_trx_logbook (
    mk_trx_logbook_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    logbook_type character(1) NOT NULL,
    referance_no character varying(20) NOT NULL,
    logbook_date timestamp(0) without time zone DEFAULT now() NOT NULL,
    descs character varying(255),
    cm_contact_id integer,
    cm_contact_person_id integer,
    action_type character(1) DEFAULT 'C'::bpchar,
    meeting_address character varying(150),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 "   DROP TABLE public.mk_trx_logbook;
       public         postgres    false            N           1259    210880 $   mk_trx_logbook_mk_trx_logbook_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mk_trx_logbook_mk_trx_logbook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.mk_trx_logbook_mk_trx_logbook_id_seq;
       public       postgres    false    335            .           0    0 $   mk_trx_logbook_mk_trx_logbook_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.mk_trx_logbook_mk_trx_logbook_id_seq OWNED BY public.mk_trx_logbook.mk_trx_logbook_id;
            public       postgres    false    334                       1259    210000    op_location    TABLE     �  CREATE TABLE public.op_location (
    op_location_id integer NOT NULL,
    location_cd character varying(10) NOT NULL,
    descs character varying(150),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.op_location;
       public         postgres    false                       1259    209998    op_location_op_location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.op_location_op_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.op_location_op_location_id_seq;
       public       postgres    false    270            /           0    0    op_location_op_location_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.op_location_op_location_id_seq OWNED BY public.op_location.op_location_id;
            public       postgres    false    269                       1259    210084 
   op_order_d    TABLE     }  CREATE TABLE public.op_order_d (
    op_order_d_id integer NOT NULL,
    op_order_h_id integer,
    descs character varying(150),
    qty integer,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.op_order_d;
       public         postgres    false                       1259    210082    op_order_d_op_order_d_id_seq    SEQUENCE     �   CREATE SEQUENCE public.op_order_d_op_order_d_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.op_order_d_op_order_d_id_seq;
       public       postgres    false    274            0           0    0    op_order_d_op_order_d_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.op_order_d_op_order_d_id_seq OWNED BY public.op_order_d.op_order_d_id;
            public       postgres    false    273                       1259    210069 
   op_order_h    TABLE     �  CREATE TABLE public.op_order_h (
    op_order_h_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    ss_subportfolio_id integer NOT NULL,
    order_no character varying(10) NOT NULL,
    order_date timestamp(0) without time zone DEFAULT now() NOT NULL,
    order_status character varying(150) DEFAULT 'N'::character varying NOT NULL,
    cm_contact_id integer NOT NULL,
    cm_contact_person_id integer NOT NULL,
    ref_no character varying(20),
    booking_category character(1) DEFAULT 'N'::bpchar NOT NULL,
    contract_no character varying(20),
    base_type character(1) DEFAULT 'V'::bpchar NOT NULL,
    base_total numeric(24,4),
    base_pickup character varying(100),
    base_rest_of character varying(100),
    pickup_from_id integer,
    deliver_to_id integer,
    pickup_date timestamp(0) without time zone NOT NULL,
    extra_pickup_id integer,
    extra_deliver_id integer,
    truck_type character(3) DEFAULT 'FTL'::bpchar NOT NULL,
    weight numeric(12,2),
    cubic numeric(12,2),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.op_order_h;
       public         postgres    false                       1259    210067    op_order_h_op_order_h_id_seq    SEQUENCE     �   CREATE SEQUENCE public.op_order_h_op_order_h_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.op_order_h_op_order_h_id_seq;
       public       postgres    false    272            1           0    0    op_order_h_op_order_h_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.op_order_h_op_order_h_id_seq OWNED BY public.op_order_h.op_order_h_id;
            public       postgres    false    271                       1259    209908 	   ss_chat_d    TABLE     @  CREATE TABLE public.ss_chat_d (
    ss_chat_d_id integer NOT NULL,
    ss_chat_h_id integer NOT NULL,
    chat_text character varying(1000) NOT NULL,
    chat_date timestamp(0) without time zone DEFAULT now() NOT NULL,
    user_id_from character varying(60) NOT NULL,
    user_id_to character varying(100),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    is_read boolean DEFAULT false
);
    DROP TABLE public.ss_chat_d;
       public         postgres    false            
           1259    209951    ss_chat_d_read_id    TABLE     �  CREATE TABLE public.ss_chat_d_read_id (
    ss_chat_d_read_id integer NOT NULL,
    ss_chat_d_id integer NOT NULL,
    user_id_from character varying(60) NOT NULL,
    user_id_to character varying(60),
    is_read boolean,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 %   DROP TABLE public.ss_chat_d_read_id;
       public         postgres    false            	           1259    209949 '   ss_chat_d_read_id_ss_chat_d_read_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_chat_d_read_id_ss_chat_d_read_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.ss_chat_d_read_id_ss_chat_d_read_id_seq;
       public       postgres    false    266            2           0    0 '   ss_chat_d_read_id_ss_chat_d_read_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.ss_chat_d_read_id_ss_chat_d_read_id_seq OWNED BY public.ss_chat_d_read_id.ss_chat_d_read_id;
            public       postgres    false    265                       1259    209906    ss_chat_d_ss_chat_d_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_chat_d_ss_chat_d_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ss_chat_d_ss_chat_d_id_seq;
       public       postgres    false    262            3           0    0    ss_chat_d_ss_chat_d_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ss_chat_d_ss_chat_d_id_seq OWNED BY public.ss_chat_d.ss_chat_d_id;
            public       postgres    false    261                       1259    209897 	   ss_chat_h    TABLE     �  CREATE TABLE public.ss_chat_h (
    ss_chat_h_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    ss_subportfolio_id integer NOT NULL,
    subject character varying(60) NOT NULL,
    user_id_to character varying(150) NOT NULL,
    doc_date timestamp(0) without time zone DEFAULT now() NOT NULL,
    doc_type character varying(60),
    doc_no character varying(60) NOT NULL,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    user_id_from character varying(60) NOT NULL
);
    DROP TABLE public.ss_chat_h;
       public         postgres    false                       1259    209895    ss_chat_h_ss_chat_h_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_chat_h_ss_chat_h_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ss_chat_h_ss_chat_h_id_seq;
       public       postgres    false    260            4           0    0    ss_chat_h_ss_chat_h_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ss_chat_h_ss_chat_h_id_seq OWNED BY public.ss_chat_h.ss_chat_h_id;
            public       postgres    false    259            �            1259    209374    ss_city    TABLE     �  CREATE TABLE public.ss_city (
    ss_city_id integer NOT NULL,
    ss_province_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    descs character varying(150) NOT NULL,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.ss_city;
       public         postgres    false            �            1259    209372    ss_city_ss_city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_city_ss_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.ss_city_ss_city_id_seq;
       public       postgres    false    232            5           0    0    ss_city_ss_city_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.ss_city_ss_city_id_seq OWNED BY public.ss_city.ss_city_id;
            public       postgres    false    231            �            1259    209472 
   ss_country    TABLE     �  CREATE TABLE public.ss_country (
    ss_country_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    short_descs character varying(60) NOT NULL,
    descs character varying(150) NOT NULL,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    phone_country_code character varying(5)
);
    DROP TABLE public.ss_country;
       public         postgres    false            �            1259    209470    ss_country_ss_country_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_country_ss_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.ss_country_ss_country_id_seq;
       public       postgres    false    237            6           0    0    ss_country_ss_country_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.ss_country_ss_country_id_seq OWNED BY public.ss_country.ss_country_id;
            public       postgres    false    236            �            1259    209159    ss_dashboard_group    TABLE     �  CREATE TABLE public.ss_dashboard_group (
    ss_dashboard_group_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    ss_group_id integer NOT NULL,
    ss_master_dashboard_id integer NOT NULL,
    user_input character varying(20) NOT NULL,
    user_edit character varying(20) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 &   DROP TABLE public.ss_dashboard_group;
       public         postgres    false            �            1259    209164 ,   ss_dashboard_group_ss_dashboard_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_dashboard_group_ss_dashboard_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.ss_dashboard_group_ss_dashboard_group_id_seq;
       public       postgres    false    200            7           0    0 ,   ss_dashboard_group_ss_dashboard_group_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.ss_dashboard_group_ss_dashboard_group_id_seq OWNED BY public.ss_dashboard_group.ss_dashboard_group_id;
            public       postgres    false    201            �            1259    209166    ss_define_column    TABLE       CREATE TABLE public.ss_define_column (
    ss_define_column_id integer NOT NULL,
    user_id character varying(10) NOT NULL,
    subportfolio_id integer NOT NULL,
    option_url character varying(60) NOT NULL,
    line_no integer NOT NULL,
    column_field character varying(2000) NOT NULL,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 $   DROP TABLE public.ss_define_column;
       public         postgres    false            �            1259    209174 (   ss_define_column_ss_define_column_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_define_column_ss_define_column_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.ss_define_column_ss_define_column_id_seq;
       public       postgres    false    202            8           0    0 (   ss_define_column_ss_define_column_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.ss_define_column_ss_define_column_id_seq OWNED BY public.ss_define_column.ss_define_column_id;
            public       postgres    false    203            �            1259    209384    ss_district    TABLE     �  CREATE TABLE public.ss_district (
    ss_district_id integer NOT NULL,
    ss_city_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    descs character varying(150) NOT NULL,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.ss_district;
       public         postgres    false            �            1259    209382    ss_distric_ss_distric_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_distric_ss_distric_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.ss_distric_ss_distric_id_seq;
       public       postgres    false    234            9           0    0    ss_distric_ss_distric_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.ss_distric_ss_distric_id_seq OWNED BY public.ss_district.ss_district_id;
            public       postgres    false    233            �            1259    209176    ss_group    TABLE     �  CREATE TABLE public.ss_group (
    ss_group_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    descs character varying(150) NOT NULL,
    short_descs character varying(60) NOT NULL,
    user_type character varying(1) NOT NULL,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.ss_group;
       public         postgres    false            �            1259    209181    ss_group_new_ss_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_group_new_ss_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.ss_group_new_ss_group_id_seq;
       public       postgres    false    204            :           0    0    ss_group_new_ss_group_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ss_group_new_ss_group_id_seq OWNED BY public.ss_group.ss_group_id;
            public       postgres    false    205            �            1259    209183    ss_menu    TABLE     B  CREATE TABLE public.ss_menu (
    ss_menu_id integer NOT NULL,
    title character varying(100) NOT NULL,
    menu_url character varying(100) NOT NULL,
    menu_type character varying(1) NOT NULL,
    parent_menu_id integer DEFAULT 0 NOT NULL,
    icon_class character varying(60),
    order_seq integer,
    ss_module_id integer,
    user_input character varying(20) NOT NULL,
    user_edit character varying(20) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now(),
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    level_no integer
);
    DROP TABLE public.ss_menu;
       public         postgres    false            �            1259    209189    ss_menu_dashboard    TABLE     �  CREATE TABLE public.ss_menu_dashboard (
    ss_master_dashboard_id integer NOT NULL,
    menu_url character varying(100) NOT NULL,
    title character varying(150) NOT NULL,
    short_title character varying(60) NOT NULL,
    order_seq integer NOT NULL,
    user_input character varying(20) NOT NULL,
    user_edit character varying(20) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now(),
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 %   DROP TABLE public.ss_menu_dashboard;
       public         postgres    false            �            1259    209194 ,   ss_menu_dashboard_ss_master_dashboard_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_menu_dashboard_ss_master_dashboard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.ss_menu_dashboard_ss_master_dashboard_id_seq;
       public       postgres    false    207            ;           0    0 ,   ss_menu_dashboard_ss_master_dashboard_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.ss_menu_dashboard_ss_master_dashboard_id_seq OWNED BY public.ss_menu_dashboard.ss_master_dashboard_id;
            public       postgres    false    208            .           1259    210396    ss_menu_group    TABLE     �  CREATE TABLE public.ss_menu_group (
    ss_menu_group_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    ss_menu_id integer NOT NULL,
    ss_group_id integer NOT NULL,
    add_status boolean DEFAULT false NOT NULL,
    edit_status boolean DEFAULT false NOT NULL,
    delete_status boolean DEFAULT false NOT NULL,
    view_status boolean DEFAULT false NOT NULL,
    post_status boolean DEFAULT false NOT NULL,
    user_input character varying(20) NOT NULL,
    user_edit character varying(20) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 !   DROP TABLE public.ss_menu_group;
       public         postgres    false            -           1259    210394 '   ss_menu_group_new_ss_menu_group_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.ss_menu_group_new_ss_menu_group_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.ss_menu_group_new_ss_menu_group_id_seq1;
       public       postgres    false    302            <           0    0 '   ss_menu_group_new_ss_menu_group_id_seq1    SEQUENCE OWNED BY     n   ALTER SEQUENCE public.ss_menu_group_new_ss_menu_group_id_seq1 OWNED BY public.ss_menu_group.ss_menu_group_id;
            public       postgres    false    301            �            1259    209208    ss_menu_ss_menu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_menu_ss_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.ss_menu_ss_menu_id_seq;
       public       postgres    false    206            =           0    0    ss_menu_ss_menu_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.ss_menu_ss_menu_id_seq OWNED BY public.ss_menu.ss_menu_id;
            public       postgres    false    209            �            1259    209210    ss_menu_temp    TABLE     �  CREATE TABLE public.ss_menu_temp (
    ss_menu_id integer,
    title character varying(100) NOT NULL,
    menu_url character varying(100) NOT NULL,
    menu_type character varying(1) NOT NULL,
    parent_menu_id integer DEFAULT 0 NOT NULL,
    icon_class character varying(60),
    order_seq integer,
    ss_module_id integer,
    level_no integer,
    on_event character varying(20) NOT NULL,
    user_input character varying(20) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now()
);
     DROP TABLE public.ss_menu_temp;
       public         postgres    false            �            1259    209215 	   ss_module    TABLE     l  CREATE TABLE public.ss_module (
    ss_module_id integer NOT NULL,
    descs character varying(150) NOT NULL,
    short_descs character varying(60) NOT NULL,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone NOT NULL,
    time_edit timestamp(0) without time zone NOT NULL
);
    DROP TABLE public.ss_module;
       public         postgres    false            �            1259    209218    ss_module_ss_module_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_module_ss_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ss_module_ss_module_id_seq;
       public       postgres    false    211            >           0    0    ss_module_ss_module_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ss_module_ss_module_id_seq OWNED BY public.ss_module.ss_module_id;
            public       postgres    false    212            b           1259    211058    ss_notification    TABLE     e  CREATE TABLE public.ss_notification (
    ss_notification_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    user_id character varying(20) NOT NULL,
    notification_date timestamp(0) without time zone NOT NULL,
    descs character varying(255) NOT NULL,
    notification_status character varying(1) NOT NULL,
    link_url character varying(60),
    link_id integer,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 #   DROP TABLE public.ss_notification;
       public         postgres    false            a           1259    211056 &   ss_notification_ss_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_notification_ss_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.ss_notification_ss_notification_id_seq;
       public       postgres    false    354            ?           0    0 &   ss_notification_ss_notification_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.ss_notification_ss_notification_id_seq OWNED BY public.ss_notification.ss_notification_id;
            public       postgres    false    353            �            1259    209220    ss_option_db    TABLE     M  CREATE TABLE public.ss_option_db (
    ss_option_db_id integer NOT NULL,
    option_url character varying(60) NOT NULL,
    method_api character varying(100) NOT NULL,
    sp character varying(100) NOT NULL,
    line_no integer,
    table_name character varying(60),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    order_save integer,
    method_vue character varying(20),
    order_update integer
);
     DROP TABLE public.ss_option_db;
       public         postgres    false            �            1259    209225     ss_option_db_ss_option_db_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_option_db_ss_option_db_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.ss_option_db_ss_option_db_id_seq;
       public       postgres    false    213            @           0    0     ss_option_db_ss_option_db_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.ss_option_db_ss_option_db_id_seq OWNED BY public.ss_option_db.ss_option_db_id;
            public       postgres    false    214            �            1259    209227    ss_option_function    TABLE     �  CREATE TABLE public.ss_option_function (
    ss_option_function_id integer NOT NULL,
    option_function_cd character varying(100) NOT NULL,
    module_cd character varying(10) NOT NULL,
    sp_name character varying(100) NOT NULL,
    sp_param character varying(500),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 &   DROP TABLE public.ss_option_function;
       public         postgres    false            �            1259    209233 ,   ss_option_function_ss_option_function_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_option_function_ss_option_function_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.ss_option_function_ss_option_function_id_seq;
       public       postgres    false    215            A           0    0 ,   ss_option_function_ss_option_function_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.ss_option_function_ss_option_function_id_seq OWNED BY public.ss_option_function.ss_option_function_id;
            public       postgres    false    216            �            1259    209235    ss_option_lookup    TABLE     #  CREATE TABLE public.ss_option_lookup (
    ss_option_lookup_id integer NOT NULL,
    option_lookup_cd character varying(100) NOT NULL,
    column_db character varying(100) NOT NULL,
    view_name character varying(100) NOT NULL,
    source_field character varying(255),
    display_lookup character varying(100),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 $   DROP TABLE public.ss_option_lookup;
       public         postgres    false            �            1259    209241 (   ss_option_lookup_ss_option_lookup_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_option_lookup_ss_option_lookup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.ss_option_lookup_ss_option_lookup_id_seq;
       public       postgres    false    217            B           0    0 (   ss_option_lookup_ss_option_lookup_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.ss_option_lookup_ss_option_lookup_id_seq OWNED BY public.ss_option_lookup.ss_option_lookup_id;
            public       postgres    false    218            �            1259    209356    ss_province    TABLE     �  CREATE TABLE public.ss_province (
    ss_province_id integer NOT NULL,
    ss_country_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    descs character varying(150) NOT NULL,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.ss_province;
       public         postgres    false            �            1259    209354    ss_province_ss_province_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_province_ss_province_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.ss_province_ss_province_id_seq;
       public       postgres    false    230            C           0    0    ss_province_ss_province_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.ss_province_ss_province_id_seq OWNED BY public.ss_province.ss_province_id;
            public       postgres    false    229                       1259    210186    ss_running_no    TABLE     �  CREATE TABLE public.ss_running_no (
    ss_running_no_id integer NOT NULL,
    module_cd character varying(10) NOT NULL,
    form character varying(100) NOT NULL,
    prepix character varying(60) NOT NULL,
    digit_no integer,
    running_no integer,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 !   DROP TABLE public.ss_running_no;
       public         postgres    false                       1259    210184 "   ss_running_no_ss_running_no_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_running_no_ss_running_no_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.ss_running_no_ss_running_no_id_seq;
       public       postgres    false    280            D           0    0 "   ss_running_no_ss_running_no_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.ss_running_no_ss_running_no_id_seq OWNED BY public.ss_running_no.ss_running_no_id;
            public       postgres    false    279                       1259    209884    ss_send_email    TABLE     �  CREATE TABLE public.ss_send_email (
    ss_send_email_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    ss_subportfolio_id integer NOT NULL,
    sfrom character varying(100) NOT NULL,
    sto character varying(150) NOT NULL,
    cc character varying(150),
    subject character varying(100) NOT NULL,
    body character varying,
    doc_type character varying(10),
    doc_no character varying(50),
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 !   DROP TABLE public.ss_send_email;
       public         postgres    false                       1259    209882 "   ss_send_email_ss_send_email_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_send_email_ss_send_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.ss_send_email_ss_send_email_id_seq;
       public       postgres    false    258            E           0    0 "   ss_send_email_ss_send_email_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.ss_send_email_ss_send_email_id_seq OWNED BY public.ss_send_email.ss_send_email_id;
            public       postgres    false    257            �            1259    209243    ss_user    TABLE       CREATE TABLE public.ss_user (
    ss_user_id integer NOT NULL,
    user_id character varying(20) NOT NULL,
    ss_group_id integer,
    user_name character varying(60) NOT NULL,
    password character varying(60) NOT NULL,
    email character varying(60) NOT NULL,
    user_level character varying(1) NOT NULL,
    expired_date timestamp(0) without time zone,
    is_inactive character varying(1) NOT NULL,
    job_title character varying(60),
    hand_phone character varying(60),
    last_change_password timestamp(0) without time zone,
    default_language character varying(10),
    user_input character varying(20) NOT NULL,
    user_edit character varying(20) NOT NULL,
    portfolio_id integer NOT NULL,
    subportfolio_id integer NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL,
    file_name character varying(100),
    path_file character varying(150),
    address character varying(150),
    notes character varying
);
    DROP TABLE public.ss_user;
       public         postgres    false            �            1259    209248    ss_user_favorite    TABLE     �  CREATE TABLE public.ss_user_favorite (
    ss_user_favorite_id integer NOT NULL,
    ss_portfolio_id integer NOT NULL,
    user_id character varying(20) NOT NULL,
    ss_menu_id integer NOT NULL,
    user_input character varying(20) NOT NULL,
    user_edit character varying(20) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now(),
    time_edit timestamp(0) without time zone DEFAULT now(),
    row_no integer
);
 $   DROP TABLE public.ss_user_favorite;
       public         postgres    false            �            1259    209253 ,   ss_user_favorite_new_ss_user_favorite_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_user_favorite_new_ss_user_favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.ss_user_favorite_new_ss_user_favorite_id_seq;
       public       postgres    false    220            F           0    0 ,   ss_user_favorite_new_ss_user_favorite_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.ss_user_favorite_new_ss_user_favorite_id_seq OWNED BY public.ss_user_favorite.ss_user_favorite_id;
            public       postgres    false    221            �            1259    209255    ss_user_log    TABLE     A  CREATE TABLE public.ss_user_log (
    ss_user_log_id integer NOT NULL,
    user_id character varying(20) NOT NULL,
    ip_address character varying(60),
    login_date timestamp(0) without time zone,
    logout_date timestamp(0) without time zone,
    token character varying(1000) NOT NULL,
    is_fraud boolean DEFAULT true NOT NULL,
    captcha character varying(60),
    user_input character varying(20) NOT NULL,
    user_edit character varying(20) NOT NULL,
    time_input timestamp(0) without time zone NOT NULL,
    time_edit timestamp(0) without time zone NOT NULL
);
    DROP TABLE public.ss_user_log;
       public         postgres    false            �            1259    209262    ss_user_log_ss_user_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_user_log_ss_user_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.ss_user_log_ss_user_log_id_seq;
       public       postgres    false    222            G           0    0    ss_user_log_ss_user_log_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.ss_user_log_ss_user_log_id_seq OWNED BY public.ss_user_log.ss_user_log_id;
            public       postgres    false    223            �            1259    209264    ss_user_session    TABLE     �  CREATE TABLE public.ss_user_session (
    user_session_id integer NOT NULL,
    user_id character varying(10) NOT NULL,
    token character varying(1000) NOT NULL,
    last_login timestamp(0) without time zone,
    expire_on timestamp(0) without time zone,
    ip_address character varying(20),
    user_input character varying(20) NOT NULL,
    user_edit character varying(20) NOT NULL,
    time_input timestamp(0) without time zone NOT NULL,
    time_edit timestamp(0) without time zone NOT NULL
);
 #   DROP TABLE public.ss_user_session;
       public         postgres    false            �            1259    209270 #   ss_user_session_user_session_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_user_session_user_session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.ss_user_session_user_session_id_seq;
       public       postgres    false    224            H           0    0 #   ss_user_session_user_session_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.ss_user_session_user_session_id_seq OWNED BY public.ss_user_session.user_session_id;
            public       postgres    false    225            �            1259    209272    ss_user_ss_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_user_ss_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.ss_user_ss_user_id_seq;
       public       postgres    false    219            I           0    0    ss_user_ss_user_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.ss_user_ss_user_id_seq OWNED BY public.ss_user.ss_user_id;
            public       postgres    false    226            �            1259    209274    ss_user_subportfolio    TABLE     �  CREATE TABLE public.ss_user_subportfolio (
    ss_user_subportfolio_id integer NOT NULL,
    user_id character varying(20) NOT NULL,
    subportfolio_id integer NOT NULL,
    user_input character varying(10) NOT NULL,
    user_edit character varying(10) NOT NULL,
    time_input timestamp(0) without time zone DEFAULT now() NOT NULL,
    time_edit timestamp(0) without time zone DEFAULT now() NOT NULL
);
 (   DROP TABLE public.ss_user_subportfolio;
       public         postgres    false            �            1259    209279 0   ss_user_subportfolio_ss_user_subportfolio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ss_user_subportfolio_ss_user_subportfolio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.ss_user_subportfolio_ss_user_subportfolio_id_seq;
       public       postgres    false    227            J           0    0 0   ss_user_subportfolio_ss_user_subportfolio_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.ss_user_subportfolio_ss_user_subportfolio_id_seq OWNED BY public.ss_user_subportfolio.ss_user_subportfolio_id;
            public       postgres    false    228            I           1259    210832    v_target_amt    TABLE     6   CREATE TABLE public.v_target_amt (
    sum numeric
);
     DROP TABLE public.v_target_amt;
       public         postgres    false            C           1259    210746    vcm_contact    VIEW     O  CREATE VIEW public.vcm_contact AS
 SELECT a.cm_contact_id,
    a.contact_created,
    a.contact_created AS date,
    a.name,
    a.name AS customer_name,
    a.contact_person,
    a.phone_no,
    a.address,
    scr.descs AS country,
    spr.descs AS province,
    sct.descs AS city,
    sdt.descs AS district,
    a.contact_phone_no,
    a.contact_type,
    a.marketing_id,
    b.descs AS status,
    b.customer_status_colour,
    a.time_edit,
    ((a.xmin)::text)::integer AS lastupdatestamp,
    a.cm_contact_id AS row_id
   FROM (((((public.cm_contact a
     JOIN public.cm_customer_status b ON ((a.cm_customer_status_id = b.cm_customer_status_id)))
     LEFT JOIN public.ss_country scr ON ((scr.ss_country_id = a.ss_country_id)))
     LEFT JOIN public.ss_province spr ON (((spr.ss_country_id = a.ss_country_id) AND (spr.ss_province_id = a.ss_province_id))))
     LEFT JOIN public.ss_city sct ON (((sct.ss_province_id = a.ss_province_id) AND (sct.ss_city_id = a.ss_city_id))))
     LEFT JOIN public.ss_district sdt ON (((sdt.ss_city_id = a.ss_city_id) AND (sdt.ss_district_id = a.ss_district_id))));
    DROP VIEW public.vcm_contact;
       public       postgres    false    243    307    307    307    243    243    243    243    243    243    243    243    243    243    243    243    243    243    243    237    237    234    234    234    232    232    232    230    230    230            Q           1259    210906    vcm_contact_person    VIEW     g  CREATE VIEW public.vcm_contact_person AS
 SELECT a.cm_contact_person_id,
    a.cm_contact_id,
    a.name,
    a.phone_no,
    a.email,
    a."position",
    a.descs,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.cm_contact_person_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.cm_contact_person a;
 %   DROP VIEW public.vcm_contact_person;
       public       postgres    false    268    268    268    268    268    268    268    268    268    268    268    268            �            1259    209583    vcm_contact_v2    VIEW       CREATE VIEW public.vcm_contact_v2 AS
 SELECT a.ss_portfolio_id,
    ((a.xmin)::text)::integer AS lastupdatestamp,
    a.cm_contact_id AS row_id,
    a.contact_type,
    a.contact_status,
    a.contact_created,
    a.name,
    a.address,
    a.ss_country_id,
    a.ss_province_id,
    a.ss_city_id,
    a.ss_district_id,
    a.phone_no,
    a.email,
    a.website,
    a.contact_person,
    a.contact_phone_no,
    a.file_name,
    a.path_file,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit
   FROM public.cm_contact a;
 !   DROP VIEW public.vcm_contact_v2;
       public       postgres    false    243    243    243    243    243    243    243    243    243    243    243    243    243    243    243    243    243    243    243    243    243    243    243            D           1259    210755    vcm_customer_status    VIEW     O  CREATE VIEW public.vcm_customer_status AS
 SELECT a.cm_customer_status_id,
    a.ss_portfolio_id,
    a.descs,
    a.customer_status_cd,
    a.customer_status_colour,
    ( SELECT (((b.freq || ' times per '::text) || b.month) || ' month'::text)
           FROM public.cm_customer_status_dtl b
          WHERE ((b.action_type = 'C'::bpchar) AND (b.cm_customer_status_id = a.cm_customer_status_id))) AS call_freq,
    ( SELECT (((b.freq || ' times per '::text) || b.month) || ' month'::text)
           FROM public.cm_customer_status_dtl b
          WHERE ((b.action_type = 'V'::bpchar) AND (b.cm_customer_status_id = a.cm_customer_status_id))) AS visit_freq,
    ( SELECT (((b.freq || ' times per '::text) || b.month) || ' month'::text)
           FROM public.cm_customer_status_dtl b
          WHERE ((b.action_type = 'E'::bpchar) AND (b.cm_customer_status_id = a.cm_customer_status_id))) AS entertain_freq,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.cm_customer_status_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.cm_customer_status a;
 &   DROP VIEW public.vcm_customer_status;
       public       postgres    false    307    305    305    305    307    307    307    307    307    307    305    307    307    307            4           1259    210448    vcm_customer_status_dtl    VIEW     ~  CREATE VIEW public.vcm_customer_status_dtl AS
 SELECT a.cm_customer_status_dtl_id AS cm_customer_status_dt_id,
    a.cm_customer_status_id,
    a.action,
    a.month,
    a.freq,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.cm_customer_status_dtl_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.cm_customer_status_dtl a;
 *   DROP VIEW public.vcm_customer_status_dtl;
       public       postgres    false    305    305    305    305    305    305    305    305    305    305            �            1259    209869 
   vcm_reason    VIEW     0  CREATE VIEW public.vcm_reason AS
 SELECT a.cm_reason_id,
    a.ss_portfolio_id,
    a.module_cd,
    a.reason_cd,
    a.descs,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.cm_reason_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.cm_reason a;
    DROP VIEW public.vcm_reason;
       public       postgres    false    254    254    254    254    254    254    254    254    254    254            +           1259    210356 
   vfm_driver    VIEW       CREATE VIEW public.vfm_driver AS
 SELECT a.fm_driver_id,
    a.driver_name,
    a.driver_name AS vehicle,
    a.handphone,
    a.address,
    ( SELECT max(b.expiry_date) AS sim_expiry
           FROM public.fm_driver_doc b
          WHERE ((a.fm_driver_id = b.fm_driver_id) AND ((b.doc_type)::text = 'S'::text))) AS sim_expiry,
    a.time_input AS date_added,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.fm_driver_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.fm_driver a;
    DROP VIEW public.vfm_driver;
       public       postgres    false    294    294    294    294    294    294    294    294    294    296    296    296            *           1259    210346    vfm_fleet_mstr    VIEW     �  CREATE VIEW public.vfm_fleet_mstr AS
 SELECT a.fm_fleet_mstr_id,
    a.license_plate_no,
    a.fm_fleet_type_id,
    a.fm_driver_id,
    a.fm_driver_id2,
    a.descs,
    a.bpkb_no,
    a.stnk_no,
    a.stnk_expiry_date,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.fm_fleet_mstr_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.fm_fleet_mstr a;
 !   DROP VIEW public.vfm_fleet_mstr;
       public       postgres    false    290    290    290    290    290    290    290    290    290    290    290    290    290    290            )           1259    210319    vfm_fleet_mstr_list    VIEW       CREATE VIEW public.vfm_fleet_mstr_list AS
 SELECT a.fm_fleet_mstr_id,
    a.license_plate_no AS vehicle,
    c.descs AS fleet_type,
    b.driver_name AS driver,
    a.bpkb_no,
    a.stnk_no,
    a.stnk_expiry_date AS stnk_expiry,
    a.time_edit,
    a.fm_fleet_mstr_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM ((public.fm_fleet_mstr a
     LEFT JOIN public.fm_driver b ON ((a.fm_driver_id = b.fm_driver_id)))
     JOIN public.fm_fleet_type c ON ((a.fm_fleet_type_id = c.fm_fleet_type_id)));
 &   DROP VIEW public.vfm_fleet_mstr_list;
       public       postgres    false    290    290    294    294    287    287    290    290    290    290    290    290    290                        1259    210273    vfm_fleet_type    VIEW     9  CREATE VIEW public.vfm_fleet_type AS
 SELECT a.fm_fleet_type_id,
    a.fleet_cd,
    a.descs,
    a.file_name,
    a.path_file,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.fm_fleet_type_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.fm_fleet_type a;
 !   DROP VIEW public.vfm_fleet_type;
       public       postgres    false    287    287    287    287    287    287    287    287    287    287            /           1259    210409    vget_menu_group    VIEW     �  CREATE VIEW public.vget_menu_group AS
 WITH RECURSIVE cte(ss_menu_id, title, menu_url, menu_type, parent_menu_id, icon_class, order_seq, level, ipath) AS (
         SELECT sm.ss_menu_id,
            sm.title,
            sm.menu_url,
            sm.menu_type,
            sm.parent_menu_id,
            sm.icon_class,
            sm.order_seq,
            0 AS level,
            (row_number() OVER (PARTITION BY sm.parent_menu_id ORDER BY sm.order_seq))::character varying AS ipath
           FROM public.ss_menu sm
          WHERE (sm.parent_menu_id = 0)
        UNION ALL
         SELECT mn.ss_menu_id,
            mn.title,
            mn.menu_url,
            mn.menu_type,
            mn.parent_menu_id,
            mn.icon_class,
            mn.order_seq,
            (c.level + 1) AS level,
            (((c.ipath)::text || '.'::text) || ((row_number() OVER (PARTITION BY mn.parent_menu_id ORDER BY mn.order_seq))::character varying(100))::text) AS ipath2
           FROM (public.ss_menu mn
             JOIN cte c ON ((mn.parent_menu_id = c.ss_menu_id)))
        )
 SELECT ct.ss_menu_id,
    ct.title,
    ct.menu_url,
    ct.menu_type,
    ct.parent_menu_id,
    ct.icon_class,
    ct.order_seq,
    ct.level,
    ct.ipath,
    smg.add_status,
    smg.edit_status,
    smg.delete_status,
    smg.ss_portfolio_id,
    smg.ss_group_id
   FROM (cte ct
     JOIN public.ss_menu_group smg ON ((ct.ss_menu_id = smg.ss_menu_id)));
 "   DROP VIEW public.vget_menu_group;
       public       postgres    false    302    302    206    206    206    206    206    206    302    302    302    302    206                       1259    210221    vmk_appointment    VIEW     �  CREATE VIEW public.vmk_appointment AS
 SELECT b.name AS customer_name,
    b.contact_status AS customer_status,
    ( SELECT x.appointment_date
           FROM public.mk_appointment x
          WHERE ((x.appointment_date < now()) AND (x.cm_contact_id = a.cm_contact_id))
         LIMIT 1) AS last_action,
    a.appointment_date AS next_action,
    date_part('day'::text, a.appointment_date) AS day,
        CASE date_part('month'::text, a.appointment_date)
            WHEN 1 THEN 'Jan'::text
            WHEN 2 THEN 'Feb'::text
            WHEN 3 THEN 'Mar'::text
            WHEN 4 THEN 'Apr'::text
            WHEN 5 THEN 'May'::text
            WHEN 6 THEN 'Jun'::text
            WHEN 7 THEN 'Jul'::text
            WHEN 8 THEN 'Aug'::text
            WHEN 9 THEN 'Sep'::text
            WHEN 10 THEN 'Oct'::text
            WHEN 11 THEN 'Sep'::text
            WHEN 12 THEN 'Dec'::text
            ELSE NULL::text
        END AS month,
    concat(date_part('hour'::text, a.appointment_date), ' : ', date_part('minute'::text, a.appointment_date)) AS "time",
    a.action_type AS action,
    a.cm_contact_id,
    a.time_edit,
    a.mk_appointment_id AS row_id
   FROM (public.cm_contact b
     LEFT JOIN public.mk_appointment a ON ((a.cm_contact_id = b.cm_contact_id)));
 "   DROP VIEW public.vmk_appointment;
       public       postgres    false    246    243    246    246    243    243    246    246            �            1259    209757    vmk_appointment_list    VIEW     b  CREATE VIEW public.vmk_appointment_list AS
 SELECT a.mk_appointment_id,
    a.cm_contact_id,
    a.ss_portfolio_id,
    a.action_type,
        CASE a.action_type
            WHEN 'C'::bpchar THEN 'Call'::text
            WHEN 'V'::bpchar THEN 'Visit'::text
            ELSE 'Entertaintment'::text
        END AS action,
    a.pic,
    a.appointment_date,
    a.appointment_date AS date,
    a.meeting_address,
    a.descs,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.mk_appointment_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.mk_appointment a;
 '   DROP VIEW public.vmk_appointment_list;
       public       postgres    false    246    246    246    246    246    246    246    246    246    246    246    246    246                       1259    210246    vmk_appointment_new    VIEW     �  CREATE VIEW public.vmk_appointment_new AS
 SELECT b.cm_contact_id,
    b.name AS customer_name,
    b.contact_status AS customer_status,
    b.contact_type,
    ( SELECT max(x.appointment_date) AS max
           FROM public.mk_appointment x
          WHERE ((x.cm_contact_id = b.cm_contact_id) AND (x.appointment_date < ( SELECT max(y.appointment_date) AS max
                   FROM public.mk_appointment y
                  WHERE (y.cm_contact_id = b.cm_contact_id)
                 LIMIT 1)))
         LIMIT 1) AS last_action,
    ( SELECT max(x.appointment_date) AS max
           FROM public.mk_appointment x
          WHERE (x.cm_contact_id = b.cm_contact_id)
         LIMIT 1) AS next_action,
    date_part('day'::text, ( SELECT max(x.appointment_date) AS max
           FROM public.mk_appointment x
          WHERE (x.cm_contact_id = b.cm_contact_id)
         LIMIT 1)) AS day,
        CASE date_part('month'::text, ( SELECT max(x.appointment_date) AS max
               FROM public.mk_appointment x
              WHERE (x.cm_contact_id = b.cm_contact_id)
             LIMIT 1))
            WHEN 1 THEN 'Jan'::text
            WHEN 2 THEN 'Feb'::text
            WHEN 3 THEN 'Mar'::text
            WHEN 4 THEN 'Apr'::text
            WHEN 5 THEN 'May'::text
            WHEN 6 THEN 'Jun'::text
            WHEN 7 THEN 'Jul'::text
            WHEN 8 THEN 'Aug'::text
            WHEN 9 THEN 'Sep'::text
            WHEN 10 THEN 'Oct'::text
            WHEN 11 THEN 'Sep'::text
            WHEN 12 THEN 'Dec'::text
            ELSE NULL::text
        END AS month,
    concat(date_part('hour'::text, ( SELECT max(x.appointment_date) AS max
           FROM public.mk_appointment x
          WHERE (x.cm_contact_id = b.cm_contact_id)
         LIMIT 1)), ':', date_part('minute'::text, ( SELECT max(x.appointment_date) AS max
           FROM public.mk_appointment x
          WHERE (x.cm_contact_id = b.cm_contact_id)
         LIMIT 1))) AS "time",
    ( SELECT x.action_type
           FROM public.mk_appointment x
          WHERE ((x.cm_contact_id = b.cm_contact_id) AND (x.appointment_date = ( SELECT max(y.appointment_date) AS max
                   FROM public.mk_appointment y
                  WHERE (y.cm_contact_id = b.cm_contact_id)
                 LIMIT 1)))) AS action_,
    b.time_edit,
    ( SELECT x.mk_appointment_id
           FROM public.mk_appointment x
          WHERE ((x.cm_contact_id = b.cm_contact_id) AND (x.appointment_date = ( SELECT max(y.appointment_date) AS max
                   FROM public.mk_appointment y
                  WHERE (y.cm_contact_id = b.cm_contact_id)
                 LIMIT 1)))) AS row_id,
    ( SELECT ((x.xmin)::text)::integer AS xmin
           FROM public.mk_appointment x
          WHERE ((x.cm_contact_id = b.cm_contact_id) AND (x.appointment_date = ( SELECT max(y.appointment_date) AS max
                   FROM public.mk_appointment y
                  WHERE (y.cm_contact_id = b.cm_contact_id)
                 LIMIT 1)))) AS lastupdatestamp
   FROM public.cm_contact b;
 &   DROP VIEW public.vmk_appointment_new;
       public       postgres    false    243    243    243    243    243    246    246    246    246    246            R           1259    210928    vmk_appointment_new_v1    VIEW     :  CREATE VIEW public.vmk_appointment_new_v1 AS
 SELECT b.cm_contact_id,
    b.name AS customer_name,
    c.descs AS status,
    c.customer_status_colour,
    a.action_type AS action,
    a.appointment_type,
    ( SELECT max(m.logbook_date) AS last_action
           FROM public.mk_logbook m
          WHERE ((m.ss_portfolio_id = a.ss_portfolio_id) AND (m.cm_contact_id = a.cm_contact_id) AND (m.action_type = a.action_type))) AS last_action,
    a.appointment_date AS next_action,
    a.time_edit,
    a.mk_appointment_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM ((public.mk_appointment a
     JOIN public.cm_contact b ON ((a.cm_contact_id = b.cm_contact_id)))
     JOIN public.cm_customer_status c ON ((b.cm_customer_status_id = c.cm_customer_status_id)))
  WHERE (a.appointment_type = 'A'::bpchar);
 )   DROP VIEW public.vmk_appointment_new_v1;
       public       postgres    false    246    310    310    310    310    307    307    307    246    246    246    246    246    246    246    243    243    243            S           1259    210935    vmk_appointment_newv2    VIEW       CREATE VIEW public.vmk_appointment_newv2 AS
 SELECT b.cm_contact_id,
    b.name AS customer_name,
    c.descs AS status,
    c.customer_status_colour,
    a.action_type AS action,
    a.appointment_type,
    ( SELECT max(m.logbook_date) AS last_action
           FROM public.mk_logbook m
          WHERE ((m.ss_portfolio_id = a.ss_portfolio_id) AND (m.cm_contact_id = a.cm_contact_id) AND (m.action_type = a.action_type))) AS last_action,
    a.appointment_date AS next_action,
    a.time_edit,
    a.mk_appointment_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM ((public.mk_appointment a
     JOIN public.cm_contact b ON ((a.cm_contact_id = b.cm_contact_id)))
     JOIN public.cm_customer_status c ON ((b.cm_customer_status_id = c.cm_customer_status_id)));
 (   DROP VIEW public.vmk_appointment_newv2;
       public       postgres    false    307    307    307    310    310    246    243    243    243    246    246    246    246    246    246    246    310    310            B           1259    210741    vmk_customer_list    VIEW     b  CREATE VIEW public.vmk_customer_list AS
 SELECT c.name,
    a.child_marketing_id,
    a.child_marketing_id AS marketing_id,
    b.name AS marketing_name,
    a.ss_portfolio_id,
    a.user_id,
    c.cm_contact_id AS row_id,
    ((c.xmin)::text)::integer AS lastupdatestamp,
    c.time_edit
   FROM ((public.mk_marketing_team a
     LEFT JOIN public.mk_marketing b ON (((a.ss_portfolio_id = b.ss_portfolio_id) AND ((a.child_marketing_id)::text = (b.marketing_id)::text))))
     JOIN public.cm_contact c ON (((c.ss_portfolio_id = a.ss_portfolio_id) AND ((c.marketing_id)::text = (a.child_marketing_id)::text))));
 $   DROP VIEW public.vmk_customer_list;
       public       postgres    false    243    313    313    315    315    243    243    313    315    243    243    243            U           1259    210946    vmk_logbook    VIEW       CREATE VIEW public.vmk_logbook AS
 SELECT a.mk_logbook_id,
    a.ss_portfolio_id,
    a.cm_contact_id,
    a.cm_contact_person_id,
    b.name AS contact_person_name,
    a.appoinment_date,
    a.logbook_date,
    a.action_type,
    a.meeting_address,
    a.descs,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.mk_logbook_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM (public.mk_logbook a
     LEFT JOIN public.cm_contact_person b ON ((b.cm_contact_person_id = a.cm_contact_person_id)));
    DROP VIEW public.vmk_logbook;
       public       postgres    false    310    310    310    310    310    310    310    310    310    310    310    268    268    310    310    310            <           1259    210596    vmk_marketing    VIEW     �  CREATE VIEW public.vmk_marketing AS
 SELECT a.mk_marketing_id,
    a.ss_portfolio_id,
    a.user_id,
    a.marketing_id,
    a.name,
    a.nik_id,
    a.address,
    a.email,
    a.hand_phone,
    a.status_active,
    a.join_date,
    a.monthly_point,
    a.monthly_new_prospect,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.mk_marketing_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.mk_marketing a;
     DROP VIEW public.vmk_marketing;
       public       postgres    false    313    313    313    313    313    313    313    313    313    313    313    313    313    313    313    313    313    313            >           1259    210671    vmk_marketing_list    VIEW       CREATE VIEW public.vmk_marketing_list AS
 SELECT a.marketing_id,
        CASE
            WHEN ((b.user_id)::text = (a.user_id)::text) THEN (((a.name)::text || ' (Leader) '::text))::character varying
            ELSE a.name
        END AS name,
    to_char(a.join_date, 'DD/MM/YYYY'::text) AS join_date,
    a.monthly_point,
    a.monthly_new_prospect,
        CASE
            WHEN ((b.user_id)::text = (a.user_id)::text) THEN 1
            ELSE 2
        END AS order_list,
    a.mk_marketing_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp,
    b.user_id AS user_id_login,
    a.ss_portfolio_id
   FROM (public.mk_marketing a
     JOIN public.mk_marketing_team b ON ((((b.child_marketing_id)::text = (a.marketing_id)::text) AND (b.ss_portfolio_id = a.ss_portfolio_id))));
 %   DROP VIEW public.vmk_marketing_list;
       public       postgres    false    315    315    315    313    313    313    313    313    313    313    313    313            =           1259    210612    vmk_marketing_team    VIEW     e  CREATE VIEW public.vmk_marketing_team AS
 SELECT a.mk_marketing_team_id,
    a.ss_portfolio_id,
    a.user_id,
    a.parent_marketing_id,
    a.child_marketing_id,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.mk_marketing_team_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.mk_marketing_team a;
 %   DROP VIEW public.vmk_marketing_team;
       public       postgres    false    315    315    315    315    315    315    315    315    315    315            `           1259    211041    vmk_open_order    VIEW     I  CREATE VIEW public.vmk_open_order AS
 SELECT a.ss_portfolio_id,
    a.order_date,
    a.order_no,
    a.customer_name,
    (((a.from_location)::text || '-'::text) || (a.to_location)::text) AS from_to,
    a.order_amt AS value,
        CASE a.order_type
            WHEN 'F'::bpchar THEN 'FTL'::text
            WHEN 'L'::bpchar THEN 'LTL'::text
            WHEN 'R'::bpchar THEN 'Rental'::text
            ELSE 'Project Base'::text
        END AS type,
    a.time_edit,
    a.mk_open_order_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.mk_open_order a;
 !   DROP VIEW public.vmk_open_order;
       public       postgres    false    350    350    350    350    350    350    350    350    350    350    350                       1259    210149    vmk_order_detail    VIEW     �  CREATE VIEW public.vmk_order_detail AS
 SELECT a.op_order_h_id,
    a.order_no,
    a.order_date AS date,
    a.cm_contact_id,
    a.cm_contact_person_id,
    a.ref_no,
    a.order_status,
        CASE a.order_status
            WHEN 'N'::text THEN 'Pending'::text
            WHEN 'P'::text THEN 'On Progress'::text
            WHEN 'I'::text THEN 'Issue'::text
            ELSE NULL::text
        END AS status,
    a.booking_category,
        CASE a.booking_category
            WHEN 'N'::bpchar THEN 'Non Project Base'::text
            ELSE 'Project Base'::text
        END AS type,
    a.contract_no,
    (((d.location_cd)::text || '-'::text) || (e.location_cd)::text) AS fromto,
    d.descs AS pickup_from,
    e.descs AS deliver_to,
    a.time_edit,
    a.op_order_h_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM ((((public.op_order_h a
     LEFT JOIN public.cm_contact b ON ((a.cm_contact_id = b.cm_contact_id)))
     LEFT JOIN public.cm_contact_person c ON ((a.cm_contact_person_id = c.cm_contact_person_id)))
     LEFT JOIN public.op_location d ON ((a.pickup_from_id = d.op_location_id)))
     LEFT JOIN public.op_location e ON ((a.deliver_to_id = e.op_location_id)));
 #   DROP VIEW public.vmk_order_detail;
       public       postgres    false    270    272    243    268    272    272    272    272    272    272    272    272    272    272    272    272    270    270            V           1259    210958    vmk_order_header    VIEW     �  CREATE VIEW public.vmk_order_header AS
 SELECT b.cm_contact_id AS row_id,
    ((b.xmin)::text)::integer AS lastupdatestamp,
    b.name AS customer_name,
    b.contact_status AS customer_status,
    b.cm_contact_id,
    b.marketing_id,
    c.name AS marketing_name,
    ( SELECT count(1) AS cnt
           FROM public.op_order_h h
          WHERE ((h.cm_contact_id = b.cm_contact_id) AND ((h.order_status)::text = 'N'::text))) AS pending,
    ( SELECT count(1) AS cnt
           FROM public.op_order_h h
          WHERE ((h.cm_contact_id = b.cm_contact_id) AND ((h.order_status)::text = 'P'::text))) AS progress,
    ( SELECT count(1) AS cnt
           FROM public.op_order_h h
          WHERE ((h.cm_contact_id = b.cm_contact_id) AND ((h.order_status)::text = 'I'::text))) AS issue,
    b.time_edit
   FROM (public.cm_contact b
     JOIN public.mk_marketing c ON (((b.marketing_id)::text = (c.marketing_id)::text)));
 #   DROP VIEW public.vmk_order_header;
       public       postgres    false    243    243    243    243    243    243    272    272    313    313            _           1259    211030    vmk_outstanding_payment    VIEW     �  CREATE VIEW public.vmk_outstanding_payment AS
 SELECT a.mk_outstanding_payment_dash_id,
    a.ss_portfolio_id,
    a.user_id,
    a.cm_contact_id,
    a.customer_name,
    a.marketing_id,
    a.marketing_name,
    a.outstanding_amt,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.mk_outstanding_payment_dash_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.mk_outstanding_payment_dash a;
 *   DROP VIEW public.vmk_outstanding_payment;
       public       postgres    false    344    344    344    344    344    344    344    344    344    344    344    344    344                        1259    209877    vmk_quotation    VIEW     �  CREATE VIEW public.vmk_quotation AS
 SELECT a.mk_quotation_id,
    a.ss_portfolio_id,
    a.ss_subportfolio_id,
    a.cm_contact_id,
    b.name,
    a.quotation_no,
    a.quotation_date,
    a.quotation_type,
        CASE a.quotation_type
            WHEN 'F'::bpchar THEN 'FTL'::text
            WHEN 'L'::bpchar THEN 'LTL'::text
            WHEN 'R'::bpchar THEN 'Rental'::text
            ELSE 'Project Base'::text
        END AS type,
    a.project_name,
    a.descs,
    a.project_value,
    a.expired_date,
    a.status,
    a.time_edit,
    a.mk_quotation_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM (public.mk_quotation a
     LEFT JOIN public.cm_contact b ON ((a.cm_contact_id = b.cm_contact_id)));
     DROP VIEW public.vmk_quotation;
       public       postgres    false    252    252    252    252    252    252    252    252    252    252    252    252    252    252    243    243            T           1259    210941    vmk_quotation_list    VIEW     �  CREATE VIEW public.vmk_quotation_list AS
 SELECT a.cm_contact_id,
    b.name,
    a.quotation_type,
    a.quotation_no,
    to_char(((a.quotation_date)::date)::timestamp with time zone, 'dd/mm/yyyy'::text) AS quotation_date,
        CASE a.quotation_type
            WHEN 'F'::bpchar THEN 'FTL'::text
            WHEN 'L'::bpchar THEN 'LTL'::text
            WHEN 'R'::bpchar THEN 'Rental'::text
            ELSE 'Project Base'::text
        END AS type,
    a.time_edit,
    b.marketing_id,
    a.status,
    a.mk_quotation_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM (public.mk_quotation a
     LEFT JOIN public.cm_contact b ON ((a.cm_contact_id = b.cm_contact_id)))
  ORDER BY b.marketing_id, a.quotation_no DESC;
 %   DROP VIEW public.vmk_quotation_list;
       public       postgres    false    252    252    252    252    252    252    252    252    243    243    243            �            1259    209718    vmk_todo_list    VIEW     +  CREATE VIEW public.vmk_todo_list AS
 SELECT a.mk_todo_list_id,
    a.cm_contact_id,
    a.action_type,
    a.descs,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.mk_todo_list_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.mk_todo_list a;
     DROP VIEW public.vmk_todo_list;
       public       postgres    false    248    248    248    248    248    248    248    248    248            P           1259    210896    vmk_trx_logbook    VIEW     �  CREATE VIEW public.vmk_trx_logbook AS
 SELECT a.ss_portfolio_id,
    a.logbook_type,
    a.referance_no,
    a.logbook_date,
    a.descs,
    a.cm_contact_id,
    a.cm_contact_person_id,
    a.action_type,
    a.meeting_address,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.mk_trx_logbook_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.mk_trx_logbook a;
 "   DROP VIEW public.vmk_trx_logbook;
       public       postgres    false    335    335    335    335    335    335    335    335    335    335    335    335    335    335    335                       1259    210110    vop_location    VIEW     k  CREATE VIEW public.vop_location AS
 SELECT a.op_location_id,
    a.location_cd,
    a.descs,
    ((((a.descs)::text || ' ('::text) || (a.location_cd)::text) || ')'::text) AS descs2,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.op_location_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.op_location a;
    DROP VIEW public.vop_location;
       public       postgres    false    270    270    270    270    270    270    270    270                       1259    210096    vop_order_d    VIEW       CREATE VIEW public.vop_order_d AS
 SELECT a.op_order_d_id,
    a.op_order_h_id,
    a.descs,
    a.qty,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.op_order_d_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.op_order_d a;
    DROP VIEW public.vop_order_d;
       public       postgres    false    274    274    274    274    274    274    274    274    274                       1259    210123    vop_order_h    VIEW     �  CREATE VIEW public.vop_order_h AS
 SELECT a.op_order_h_id,
    a.pickup_date,
    b.name AS customer,
    c.name AS pic,
    a.ref_no,
    a.booking_category,
    a.contract_no,
    d.descs AS pickup_from,
    e.descs AS deliver_to,
    a.time_edit,
    a.op_order_h_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM ((((public.op_order_h a
     LEFT JOIN public.cm_contact b ON ((a.cm_contact_id = b.cm_contact_id)))
     LEFT JOIN public.cm_contact_person c ON ((a.cm_contact_person_id = c.cm_contact_person_id)))
     LEFT JOIN public.op_location d ON ((a.pickup_from_id = d.op_location_id)))
     LEFT JOIN public.op_location e ON ((a.deliver_to_id = e.op_location_id)));
    DROP VIEW public.vop_order_h;
       public       postgres    false    272    272    272    272    243    243    268    268    270    270    272    272    272    272    272    272    272                       1259    209928 
   vss_chat_d    VIEW     F  CREATE VIEW public.vss_chat_d AS
 SELECT a.ss_chat_d_id,
    a.ss_chat_h_id,
    a.chat_text,
    a.chat_date,
    a.user_id_from,
    a.user_id_to,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.ss_chat_d_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.ss_chat_d a;
    DROP VIEW public.vss_chat_d;
       public       postgres    false    262    262    262    262    262    262    262    262    262    262    262                       1259    209936 
   vss_chat_h    VIEW     u  CREATE VIEW public.vss_chat_h AS
 SELECT a.ss_chat_h_id,
    a.ss_portfolio_id,
    a.ss_subportfolio_id,
    a.subject,
    a.user_id_to AS user_id,
    a.doc_date,
    a.doc_type,
    a.doc_no,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.ss_chat_h_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.ss_chat_h a;
    DROP VIEW public.vss_chat_h;
       public       postgres    false    260    260    260    260    260    260    260    260    260    260    260    260    260            �            1259    209524    vss_city    VIEW       CREATE VIEW public.vss_city AS
 SELECT a.ss_city_id,
    a.ss_province_id,
    a.ss_portfolio_id,
    a.descs,
    a.descs AS city,
    b.descs AS province,
    b.ss_country_id,
    c.descs AS country,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.ss_city_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM ((public.ss_city a
     JOIN public.ss_province b ON ((a.ss_province_id = b.ss_province_id)))
     JOIN public.ss_country c ON ((b.ss_country_id = c.ss_country_id)));
    DROP VIEW public.vss_city;
       public       postgres    false    232    230    230    230    232    232    232    232    232    237    237    232    232    232            �            1259    209534    vss_country    VIEW     �  CREATE VIEW public.vss_country AS
 SELECT ss_country.ss_country_id,
    ss_country.ss_portfolio_id,
    ss_country.descs,
    ss_country.descs AS country,
    ss_country.user_input,
    ss_country.user_edit,
    ss_country.time_input,
    ss_country.time_edit,
    ((ss_country.xmin)::text)::integer AS lastupdatestamp,
    ss_country.ss_country_id AS row_id
   FROM public.ss_country;
    DROP VIEW public.vss_country;
       public       postgres    false    237    237    237    237    237    237    237    237            �            1259    209519    vss_district    VIEW     �  CREATE VIEW public.vss_district AS
 SELECT a.ss_district_id,
    a.ss_portfolio_id,
    a.descs,
    a.descs AS district,
    a.ss_city_id,
    b.descs AS city,
    b.ss_province_id,
    c.descs AS province,
    c.ss_country_id,
    d.descs AS country,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.ss_district_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM (((public.ss_district a
     JOIN public.ss_city b ON ((a.ss_city_id = b.ss_city_id)))
     JOIN public.ss_province c ON ((b.ss_province_id = c.ss_province_id)))
     JOIN public.ss_country d ON ((c.ss_country_id = d.ss_country_id)));
    DROP VIEW public.vss_district;
       public       postgres    false    230    234    234    234    234    237    237    234    234    234    234    234    232    232    232    230    230                       1259    210217 	   vss_group    VIEW     .  CREATE VIEW public.vss_group AS
 SELECT a.ss_group_id,
    a.ss_portfolio_id,
    a.descs,
    a.short_descs,
    a.user_type,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.ss_group_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.ss_group a;
    DROP VIEW public.vss_group;
       public       postgres    false    204    204    204    204    204    204    204    204    204    204            �            1259    209407    vss_portfolio    VIEW     �  CREATE VIEW public.vss_portfolio AS
 SELECT a.name,
    a.short_name,
    a.reference_no,
    a.address,
    a.city,
    a.post_cd,
    a.phone_no,
    a.fax_no,
    a.website,
    a.rounding_factor,
    a.remarks,
    a.picture_file_name,
    a.reference_file_name,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    ((a.xmin)::text)::integer AS lastupdatestamp,
    a.ss_portfolio_id AS row_id
   FROM public.ss_portfolio a;
     DROP VIEW public.vss_portfolio;
       public       postgres    false    196    196    196    196    196    196    196    196    196    196    196    196    196    196    196    196    196    196    196            �            1259    209530    vss_province    VIEW     �  CREATE VIEW public.vss_province AS
 SELECT a.ss_province_id,
    a.ss_country_id,
    a.ss_portfolio_id,
    a.descs,
    a.descs AS province,
    b.descs AS country,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.ss_province_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM (public.ss_province a
     JOIN public.ss_country b ON ((a.ss_country_id = b.ss_country_id)));
    DROP VIEW public.vss_province;
       public       postgres    false    230    230    230    230    230    230    230    230    237    237    230                       1259    210194    vss_running_no    VIEW     G  CREATE VIEW public.vss_running_no AS
 SELECT a.ss_running_no_id,
    a.module_cd,
    a.form,
    a.prepix,
    a.digit_no,
    a.running_no,
    a.user_input,
    a.user_edit,
    a.time_input,
    a.time_edit,
    a.ss_running_no_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM public.ss_running_no a;
 !   DROP VIEW public.vss_running_no;
       public       postgres    false    280    280    280    280    280    280    280    280    280    280    280            ,           1259    210371    vss_user    VIEW       CREATE VIEW public.vss_user AS
 SELECT a.ss_user_id,
    a.user_id,
    a.ss_group_id,
    b.short_descs AS role,
    a.user_name,
    a.email,
    a.user_level,
    a.expired_date,
    a.is_inactive,
    a.job_title,
    a.hand_phone,
    a.portfolio_id,
    a.subportfolio_id,
    a.time_edit,
    to_char(a.time_input, 'DD/MM/YYYY HH24:MI'::text) AS date_added,
    a.ss_user_id AS row_id,
    ((a.xmin)::text)::integer AS lastupdatestamp
   FROM (public.ss_user a
     JOIN public.ss_group b ON ((a.ss_group_id = b.ss_group_id)));
    DROP VIEW public.vss_user;
       public       postgres    false    219    219    204    204    219    219    219    219    219    219    219    219    219    219    219    219    219                       1259    210241    vss_user_by    VIEW     
  CREATE VIEW public.vss_user_by AS
 SELECT ss_user.ss_user_id,
    ss_user.user_id,
    ss_user.ss_group_id,
    ss_user.user_name,
    ss_user.email,
    ss_user.user_level,
    ss_user.expired_date,
    ss_user.is_inactive,
    ss_user.job_title,
    ss_user.hand_phone,
    ss_user.last_change_password,
    ss_user.default_language,
    ss_user.user_input,
    ss_user.user_edit,
    ss_user.portfolio_id,
    ss_user.subportfolio_id,
    ss_user.time_input,
    ss_user.time_edit,
    ss_user.file_name,
    ss_user.path_file,
    ss_user.address,
    ss_user.notes,
    ss_user.password,
    b.descs AS group_descs,
    ((ss_user.xmin)::text)::integer AS lastupdatestamp
   FROM (public.ss_user
     LEFT JOIN public.ss_group b ON ((ss_user.ss_group_id = b.ss_group_id)));
    DROP VIEW public.vss_user_by;
       public       postgres    false    219    204    204    219    219    219    219    219    219    219    219    219    219    219    219    219    219    219    219    219    219    219    219    219    219    219            7           1259    210545    vss_user_mgm_chart    VIEW     D  CREATE VIEW public.vss_user_mgm_chart AS
 SELECT a.descs,
    a.short_descs,
    a.ss_portfolio_id,
    count(b.user_id) AS count
   FROM (public.ss_group a
     LEFT JOIN public.ss_user b ON (((a.ss_portfolio_id = b.portfolio_id) AND (a.ss_group_id = b.ss_group_id))))
  GROUP BY a.descs, a.short_descs, a.ss_portfolio_id;
 %   DROP VIEW public.vss_user_mgm_chart;
       public       postgres    false    219    219    219    204    204    204    204            �
           2604    209573    cm_contact cm_contact_id    DEFAULT     �   ALTER TABLE ONLY public.cm_contact ALTER COLUMN cm_contact_id SET DEFAULT nextval('public.cm_contact2_cm_contact_id_seq'::regclass);
 G   ALTER TABLE public.cm_contact ALTER COLUMN cm_contact_id DROP DEFAULT;
       public       postgres    false    242    243    243                       2604    209973 &   cm_contact_person cm_contact_person_id    DEFAULT     �   ALTER TABLE ONLY public.cm_contact_person ALTER COLUMN cm_contact_person_id SET DEFAULT nextval('public.cm_contact_person_cm_contact_person_id_seq'::regclass);
 U   ALTER TABLE public.cm_contact_person ALTER COLUMN cm_contact_person_id DROP DEFAULT;
       public       postgres    false    267    268    268            C           2604    210439 (   cm_customer_status cm_customer_status_id    DEFAULT     �   ALTER TABLE ONLY public.cm_customer_status ALTER COLUMN cm_customer_status_id SET DEFAULT nextval('public.cm_customer_status_cm_customer_status_id_seq'::regclass);
 W   ALTER TABLE public.cm_customer_status ALTER COLUMN cm_customer_status_id DROP DEFAULT;
       public       postgres    false    307    306    307            @           2604    210429 0   cm_customer_status_dtl cm_customer_status_dtl_id    DEFAULT     �   ALTER TABLE ONLY public.cm_customer_status_dtl ALTER COLUMN cm_customer_status_dtl_id SET DEFAULT nextval('public.cm_customer_status_dtl_cm_customer_status_dt_id_seq'::regclass);
 _   ALTER TABLE public.cm_customer_status_dtl ALTER COLUMN cm_customer_status_dtl_id DROP DEFAULT;
       public       postgres    false    305    304    305                       2604    209860    cm_reason cm_reason_id    DEFAULT     �   ALTER TABLE ONLY public.cm_reason ALTER COLUMN cm_reason_id SET DEFAULT nextval('public.cm_reason_cm_reason_id_seq'::regclass);
 E   ALTER TABLE public.cm_reason ALTER COLUMN cm_reason_id DROP DEFAULT;
       public       postgres    false    254    253    254            0           2604    210304    fm_driver fm_driver_id    DEFAULT     �   ALTER TABLE ONLY public.fm_driver ALTER COLUMN fm_driver_id SET DEFAULT nextval('public.fm_driver_fm_driver_id_seq'::regclass);
 E   ALTER TABLE public.fm_driver ALTER COLUMN fm_driver_id DROP DEFAULT;
       public       postgres    false    293    294    294            4           2604    210314    fm_driver_doc fm_driver_doc_id    DEFAULT     �   ALTER TABLE ONLY public.fm_driver_doc ALTER COLUMN fm_driver_doc_id SET DEFAULT nextval('public.fm_driver_doc_fm_driver_doc_id_seq'::regclass);
 M   ALTER TABLE public.fm_driver_doc ALTER COLUMN fm_driver_doc_id DROP DEFAULT;
       public       postgres    false    296    295    296            *           2604    210284    fm_fleet_mstr fm_fleet_mstr_id    DEFAULT     �   ALTER TABLE ONLY public.fm_fleet_mstr ALTER COLUMN fm_fleet_mstr_id SET DEFAULT nextval('public.fm_fleet_mstr_fm_fleet_mstr_id_seq'::regclass);
 M   ALTER TABLE public.fm_fleet_mstr ALTER COLUMN fm_fleet_mstr_id DROP DEFAULT;
       public       postgres    false    290    289    290            -           2604    210294 &   fm_fleet_mstr_doc fm_fleet_mstr_doc_id    DEFAULT     �   ALTER TABLE ONLY public.fm_fleet_mstr_doc ALTER COLUMN fm_fleet_mstr_doc_id SET DEFAULT nextval('public.fm_fleet_mstr_doc_fm_fleet_mstr_doc_id_seq'::regclass);
 U   ALTER TABLE public.fm_fleet_mstr_doc ALTER COLUMN fm_fleet_mstr_doc_id DROP DEFAULT;
       public       postgres    false    291    292    292            '           2604    210264    fm_fleet_type fm_fleet_type_id    DEFAULT     �   ALTER TABLE ONLY public.fm_fleet_type ALTER COLUMN fm_fleet_type_id SET DEFAULT nextval('public.fm_fleet_type_fm_fleet_type_id_seq'::regclass);
 M   ALTER TABLE public.fm_fleet_type ALTER COLUMN fm_fleet_type_id DROP DEFAULT;
       public       postgres    false    286    287    287            �
           2604    209678     mk_appointment mk_appointment_id    DEFAULT     �   ALTER TABLE ONLY public.mk_appointment ALTER COLUMN mk_appointment_id SET DEFAULT nextval('public.mk_appointment_2_mk_appointment_id_seq'::regclass);
 O   ALTER TABLE public.mk_appointment ALTER COLUMN mk_appointment_id DROP DEFAULT;
       public       postgres    false    246    245    246            v           2604    210988 &   mk_commision_dash mk_commision_dash_id    DEFAULT     �   ALTER TABLE ONLY public.mk_commision_dash ALTER COLUMN mk_commision_dash_id SET DEFAULT nextval('public.mk_commision_dash_mk_commision_dash_id_seq'::regclass);
 U   ALTER TABLE public.mk_commision_dash ALTER COLUMN mk_commision_dash_id DROP DEFAULT;
       public       postgres    false    348    347    348            s           2604    210978 ,   mk_commision_dash_dt mk_commision_dash_dt_id    DEFAULT     �   ALTER TABLE ONLY public.mk_commision_dash_dt ALTER COLUMN mk_commision_dash_dt_id SET DEFAULT nextval('public.mk_commision_dash_dt_mk_commision_dash_dt_id_seq'::regclass);
 [   ALTER TABLE public.mk_commision_dash_dt ALTER COLUMN mk_commision_dash_dt_id DROP DEFAULT;
       public       postgres    false    345    346    346            F           2604    210483    mk_logbook mk_logbook_id    DEFAULT     �   ALTER TABLE ONLY public.mk_logbook ALTER COLUMN mk_logbook_id SET DEFAULT nextval('public.mk_logbook_mk_logbook_id_seq'::regclass);
 G   ALTER TABLE public.mk_logbook ALTER COLUMN mk_logbook_id DROP DEFAULT;
       public       postgres    false    309    310    310            L           2604    210555    mk_marketing mk_marketing_id    DEFAULT     �   ALTER TABLE ONLY public.mk_marketing ALTER COLUMN mk_marketing_id SET DEFAULT nextval('public.mk_marketing_mk_marketing_id_seq'::regclass);
 K   ALTER TABLE public.mk_marketing ALTER COLUMN mk_marketing_id DROP DEFAULT;
       public       postgres    false    313    312    313            \           2604    210716 *   mk_marketing_target mk_marketing_target_id    DEFAULT     �   ALTER TABLE ONLY public.mk_marketing_target ALTER COLUMN mk_marketing_target_id SET DEFAULT nextval('public.mk_marketing_target_mk_marketing_target_id_seq'::regclass);
 Y   ALTER TABLE public.mk_marketing_target ALTER COLUMN mk_marketing_target_id DROP DEFAULT;
       public       postgres    false    321    320    321            _           2604    210796 4   mk_marketing_target_dash mk_marketing_target_dash_id    DEFAULT     �   ALTER TABLE ONLY public.mk_marketing_target_dash ALTER COLUMN mk_marketing_target_dash_id SET DEFAULT nextval('public.mk_marketing_target_dash_mk_marketing_target_dash_id_seq'::regclass);
 c   ALTER TABLE public.mk_marketing_target_dash ALTER COLUMN mk_marketing_target_dash_id DROP DEFAULT;
       public       postgres    false    325    326    326            b           2604    210817 :   mk_marketing_target_dash_dt mk_marketing_target_dash_dt_id    DEFAULT     �   ALTER TABLE ONLY public.mk_marketing_target_dash_dt ALTER COLUMN mk_marketing_target_dash_dt_id SET DEFAULT nextval('public.mk_marketing_target_dash_dt_mk_marketing_target_dash_dt_id_seq'::regclass);
 i   ALTER TABLE public.mk_marketing_target_dash_dt ALTER COLUMN mk_marketing_target_dash_dt_id DROP DEFAULT;
       public       postgres    false    328    327    328            P           2604    210569 &   mk_marketing_team mk_marketing_team_id    DEFAULT     �   ALTER TABLE ONLY public.mk_marketing_team ALTER COLUMN mk_marketing_team_id SET DEFAULT nextval('public.mk_marketing_team_mk_marketing_team_id_seq'::regclass);
 U   ALTER TABLE public.mk_marketing_team ALTER COLUMN mk_marketing_team_id DROP DEFAULT;
       public       postgres    false    314    315    315            e           2604    210843 ,   mk_new_prospect_dash mk_new_prospect_dash_id    DEFAULT     �   ALTER TABLE ONLY public.mk_new_prospect_dash ALTER COLUMN mk_new_prospect_dash_id SET DEFAULT nextval('public.mk_new_prospect_dash_mk_new_prospect_dash_id_seq'::regclass);
 [   ALTER TABLE public.mk_new_prospect_dash ALTER COLUMN mk_new_prospect_dash_id DROP DEFAULT;
       public       postgres    false    330    331    331            h           2604    210866 2   mk_new_prospect_dash_dt mk_new_prospect_dash_dt_id    DEFAULT     �   ALTER TABLE ONLY public.mk_new_prospect_dash_dt ALTER COLUMN mk_new_prospect_dash_dt_id SET DEFAULT nextval('public.mk_new_prospect_dash_dt_mk_new_prospect_dash_dt_id_seq'::regclass);
 a   ALTER TABLE public.mk_new_prospect_dash_dt ALTER COLUMN mk_new_prospect_dash_dt_id DROP DEFAULT;
       public       postgres    false    332    333    333            y           2604    210998    mk_open_order mk_open_order_id    DEFAULT     �   ALTER TABLE ONLY public.mk_open_order ALTER COLUMN mk_open_order_id SET DEFAULT nextval('public.mk_open_order_mk_open_order_id_seq'::regclass);
 M   ALTER TABLE public.mk_open_order ALTER COLUMN mk_open_order_id DROP DEFAULT;
       public       postgres    false    350    349    350            p           2604    210968 :   mk_outstanding_payment_dash mk_outstanding_payment_dash_id    DEFAULT     �   ALTER TABLE ONLY public.mk_outstanding_payment_dash ALTER COLUMN mk_outstanding_payment_dash_id SET DEFAULT nextval('public.mk_outstanding_payment_dash_mk_outstanding_payment_dash_id_seq'::regclass);
 i   ALTER TABLE public.mk_outstanding_payment_dash ALTER COLUMN mk_outstanding_payment_dash_id DROP DEFAULT;
       public       postgres    false    343    344    344            �
           2604    209786    mk_quotation mk_quotation_id    DEFAULT     �   ALTER TABLE ONLY public.mk_quotation ALTER COLUMN mk_quotation_id SET DEFAULT nextval('public.mk_quotation_mk_quotation_id_seq'::regclass);
 K   ALTER TABLE public.mk_quotation ALTER COLUMN mk_quotation_id DROP DEFAULT;
       public       postgres    false    251    252    252            �
           2604    209709    mk_todo_list mk_todo_list_id    DEFAULT     �   ALTER TABLE ONLY public.mk_todo_list ALTER COLUMN mk_todo_list_id SET DEFAULT nextval('public.mk_todo_list_mk_todo_list_id_seq'::regclass);
 K   ALTER TABLE public.mk_todo_list ALTER COLUMN mk_todo_list_id DROP DEFAULT;
       public       postgres    false    247    248    248            k           2604    210885     mk_trx_logbook mk_trx_logbook_id    DEFAULT     �   ALTER TABLE ONLY public.mk_trx_logbook ALTER COLUMN mk_trx_logbook_id SET DEFAULT nextval('public.mk_trx_logbook_mk_trx_logbook_id_seq'::regclass);
 O   ALTER TABLE public.mk_trx_logbook ALTER COLUMN mk_trx_logbook_id DROP DEFAULT;
       public       postgres    false    335    334    335                       2604    210003    op_location op_location_id    DEFAULT     �   ALTER TABLE ONLY public.op_location ALTER COLUMN op_location_id SET DEFAULT nextval('public.op_location_op_location_id_seq'::regclass);
 I   ALTER TABLE public.op_location ALTER COLUMN op_location_id DROP DEFAULT;
       public       postgres    false    269    270    270            !           2604    210087    op_order_d op_order_d_id    DEFAULT     �   ALTER TABLE ONLY public.op_order_d ALTER COLUMN op_order_d_id SET DEFAULT nextval('public.op_order_d_op_order_d_id_seq'::regclass);
 G   ALTER TABLE public.op_order_d ALTER COLUMN op_order_d_id DROP DEFAULT;
       public       postgres    false    274    273    274                       2604    210072    op_order_h op_order_h_id    DEFAULT     �   ALTER TABLE ONLY public.op_order_h ALTER COLUMN op_order_h_id SET DEFAULT nextval('public.op_order_h_op_order_h_id_seq'::regclass);
 G   ALTER TABLE public.op_order_h ALTER COLUMN op_order_h_id DROP DEFAULT;
       public       postgres    false    271    272    272                       2604    209911    ss_chat_d ss_chat_d_id    DEFAULT     �   ALTER TABLE ONLY public.ss_chat_d ALTER COLUMN ss_chat_d_id SET DEFAULT nextval('public.ss_chat_d_ss_chat_d_id_seq'::regclass);
 E   ALTER TABLE public.ss_chat_d ALTER COLUMN ss_chat_d_id DROP DEFAULT;
       public       postgres    false    262    261    262                       2604    209954 #   ss_chat_d_read_id ss_chat_d_read_id    DEFAULT     �   ALTER TABLE ONLY public.ss_chat_d_read_id ALTER COLUMN ss_chat_d_read_id SET DEFAULT nextval('public.ss_chat_d_read_id_ss_chat_d_read_id_seq'::regclass);
 R   ALTER TABLE public.ss_chat_d_read_id ALTER COLUMN ss_chat_d_read_id DROP DEFAULT;
       public       postgres    false    265    266    266                       2604    209900    ss_chat_h ss_chat_h_id    DEFAULT     �   ALTER TABLE ONLY public.ss_chat_h ALTER COLUMN ss_chat_h_id SET DEFAULT nextval('public.ss_chat_h_ss_chat_h_id_seq'::regclass);
 E   ALTER TABLE public.ss_chat_h ALTER COLUMN ss_chat_h_id DROP DEFAULT;
       public       postgres    false    260    259    260            �
           2604    209377    ss_city ss_city_id    DEFAULT     x   ALTER TABLE ONLY public.ss_city ALTER COLUMN ss_city_id SET DEFAULT nextval('public.ss_city_ss_city_id_seq'::regclass);
 A   ALTER TABLE public.ss_city ALTER COLUMN ss_city_id DROP DEFAULT;
       public       postgres    false    231    232    232            �
           2604    209475    ss_country ss_country_id    DEFAULT     �   ALTER TABLE ONLY public.ss_country ALTER COLUMN ss_country_id SET DEFAULT nextval('public.ss_country_ss_country_id_seq'::regclass);
 G   ALTER TABLE public.ss_country ALTER COLUMN ss_country_id DROP DEFAULT;
       public       postgres    false    236    237    237            �
           2604    209286 (   ss_dashboard_group ss_dashboard_group_id    DEFAULT     �   ALTER TABLE ONLY public.ss_dashboard_group ALTER COLUMN ss_dashboard_group_id SET DEFAULT nextval('public.ss_dashboard_group_ss_dashboard_group_id_seq'::regclass);
 W   ALTER TABLE public.ss_dashboard_group ALTER COLUMN ss_dashboard_group_id DROP DEFAULT;
       public       postgres    false    201    200            �
           2604    209287 $   ss_define_column ss_define_column_id    DEFAULT     �   ALTER TABLE ONLY public.ss_define_column ALTER COLUMN ss_define_column_id SET DEFAULT nextval('public.ss_define_column_ss_define_column_id_seq'::regclass);
 S   ALTER TABLE public.ss_define_column ALTER COLUMN ss_define_column_id DROP DEFAULT;
       public       postgres    false    203    202            �
           2604    209387    ss_district ss_district_id    DEFAULT     �   ALTER TABLE ONLY public.ss_district ALTER COLUMN ss_district_id SET DEFAULT nextval('public.ss_distric_ss_distric_id_seq'::regclass);
 I   ALTER TABLE public.ss_district ALTER COLUMN ss_district_id DROP DEFAULT;
       public       postgres    false    233    234    234            �
           2604    209288    ss_group ss_group_id    DEFAULT     �   ALTER TABLE ONLY public.ss_group ALTER COLUMN ss_group_id SET DEFAULT nextval('public.ss_group_new_ss_group_id_seq'::regclass);
 C   ALTER TABLE public.ss_group ALTER COLUMN ss_group_id DROP DEFAULT;
       public       postgres    false    205    204            �
           2604    209289    ss_menu ss_menu_id    DEFAULT     x   ALTER TABLE ONLY public.ss_menu ALTER COLUMN ss_menu_id SET DEFAULT nextval('public.ss_menu_ss_menu_id_seq'::regclass);
 A   ALTER TABLE public.ss_menu ALTER COLUMN ss_menu_id DROP DEFAULT;
       public       postgres    false    209    206            �
           2604    209290 (   ss_menu_dashboard ss_master_dashboard_id    DEFAULT     �   ALTER TABLE ONLY public.ss_menu_dashboard ALTER COLUMN ss_master_dashboard_id SET DEFAULT nextval('public.ss_menu_dashboard_ss_master_dashboard_id_seq'::regclass);
 W   ALTER TABLE public.ss_menu_dashboard ALTER COLUMN ss_master_dashboard_id DROP DEFAULT;
       public       postgres    false    208    207            8           2604    210399    ss_menu_group ss_menu_group_id    DEFAULT     �   ALTER TABLE ONLY public.ss_menu_group ALTER COLUMN ss_menu_group_id SET DEFAULT nextval('public.ss_menu_group_new_ss_menu_group_id_seq1'::regclass);
 M   ALTER TABLE public.ss_menu_group ALTER COLUMN ss_menu_group_id DROP DEFAULT;
       public       postgres    false    302    301    302            �
           2604    209292    ss_module ss_module_id    DEFAULT     �   ALTER TABLE ONLY public.ss_module ALTER COLUMN ss_module_id SET DEFAULT nextval('public.ss_module_ss_module_id_seq'::regclass);
 E   ALTER TABLE public.ss_module ALTER COLUMN ss_module_id DROP DEFAULT;
       public       postgres    false    212    211            |           2604    211061 "   ss_notification ss_notification_id    DEFAULT     �   ALTER TABLE ONLY public.ss_notification ALTER COLUMN ss_notification_id SET DEFAULT nextval('public.ss_notification_ss_notification_id_seq'::regclass);
 Q   ALTER TABLE public.ss_notification ALTER COLUMN ss_notification_id DROP DEFAULT;
       public       postgres    false    353    354    354            �
           2604    209293    ss_option_db ss_option_db_id    DEFAULT     �   ALTER TABLE ONLY public.ss_option_db ALTER COLUMN ss_option_db_id SET DEFAULT nextval('public.ss_option_db_ss_option_db_id_seq'::regclass);
 K   ALTER TABLE public.ss_option_db ALTER COLUMN ss_option_db_id DROP DEFAULT;
       public       postgres    false    214    213            �
           2604    209294 (   ss_option_function ss_option_function_id    DEFAULT     �   ALTER TABLE ONLY public.ss_option_function ALTER COLUMN ss_option_function_id SET DEFAULT nextval('public.ss_option_function_ss_option_function_id_seq'::regclass);
 W   ALTER TABLE public.ss_option_function ALTER COLUMN ss_option_function_id DROP DEFAULT;
       public       postgres    false    216    215            �
           2604    209295 $   ss_option_lookup ss_option_lookup_id    DEFAULT     �   ALTER TABLE ONLY public.ss_option_lookup ALTER COLUMN ss_option_lookup_id SET DEFAULT nextval('public.ss_option_lookup_ss_option_lookup_id_seq'::regclass);
 S   ALTER TABLE public.ss_option_lookup ALTER COLUMN ss_option_lookup_id DROP DEFAULT;
       public       postgres    false    218    217            �
           2604    209296    ss_portfolio ss_portfolio_id    DEFAULT     �   ALTER TABLE ONLY public.ss_portfolio ALTER COLUMN ss_portfolio_id SET DEFAULT nextval('public.cm_portfolio_cm_portfolio_id_seq'::regclass);
 K   ALTER TABLE public.ss_portfolio ALTER COLUMN ss_portfolio_id DROP DEFAULT;
       public       postgres    false    197    196            �
           2604    209359    ss_province ss_province_id    DEFAULT     �   ALTER TABLE ONLY public.ss_province ALTER COLUMN ss_province_id SET DEFAULT nextval('public.ss_province_ss_province_id_seq'::regclass);
 I   ALTER TABLE public.ss_province ALTER COLUMN ss_province_id DROP DEFAULT;
       public       postgres    false    230    229    230            $           2604    210189    ss_running_no ss_running_no_id    DEFAULT     �   ALTER TABLE ONLY public.ss_running_no ALTER COLUMN ss_running_no_id SET DEFAULT nextval('public.ss_running_no_ss_running_no_id_seq'::regclass);
 M   ALTER TABLE public.ss_running_no ALTER COLUMN ss_running_no_id DROP DEFAULT;
       public       postgres    false    279    280    280                       2604    209887    ss_send_email ss_send_email_id    DEFAULT     �   ALTER TABLE ONLY public.ss_send_email ALTER COLUMN ss_send_email_id SET DEFAULT nextval('public.ss_send_email_ss_send_email_id_seq'::regclass);
 M   ALTER TABLE public.ss_send_email ALTER COLUMN ss_send_email_id DROP DEFAULT;
       public       postgres    false    257    258    258            �
           2604    209297 "   ss_subportfolio ss_subportfolio_id    DEFAULT     �   ALTER TABLE ONLY public.ss_subportfolio ALTER COLUMN ss_subportfolio_id SET DEFAULT nextval('public.cm_subportfolio_new_cm_subportfolio_id_seq'::regclass);
 Q   ALTER TABLE public.ss_subportfolio ALTER COLUMN ss_subportfolio_id DROP DEFAULT;
       public       postgres    false    199    198            �
           2604    209298    ss_user ss_user_id    DEFAULT     x   ALTER TABLE ONLY public.ss_user ALTER COLUMN ss_user_id SET DEFAULT nextval('public.ss_user_ss_user_id_seq'::regclass);
 A   ALTER TABLE public.ss_user ALTER COLUMN ss_user_id DROP DEFAULT;
       public       postgres    false    226    219            �
           2604    209299 $   ss_user_favorite ss_user_favorite_id    DEFAULT     �   ALTER TABLE ONLY public.ss_user_favorite ALTER COLUMN ss_user_favorite_id SET DEFAULT nextval('public.ss_user_favorite_new_ss_user_favorite_id_seq'::regclass);
 S   ALTER TABLE public.ss_user_favorite ALTER COLUMN ss_user_favorite_id DROP DEFAULT;
       public       postgres    false    221    220            �
           2604    209300    ss_user_log ss_user_log_id    DEFAULT     �   ALTER TABLE ONLY public.ss_user_log ALTER COLUMN ss_user_log_id SET DEFAULT nextval('public.ss_user_log_ss_user_log_id_seq'::regclass);
 I   ALTER TABLE public.ss_user_log ALTER COLUMN ss_user_log_id DROP DEFAULT;
       public       postgres    false    223    222            �
           2604    209301    ss_user_session user_session_id    DEFAULT     �   ALTER TABLE ONLY public.ss_user_session ALTER COLUMN user_session_id SET DEFAULT nextval('public.ss_user_session_user_session_id_seq'::regclass);
 N   ALTER TABLE public.ss_user_session ALTER COLUMN user_session_id DROP DEFAULT;
       public       postgres    false    225    224            �
           2604    209302 ,   ss_user_subportfolio ss_user_subportfolio_id    DEFAULT     �   ALTER TABLE ONLY public.ss_user_subportfolio ALTER COLUMN ss_user_subportfolio_id SET DEFAULT nextval('public.ss_user_subportfolio_ss_user_subportfolio_id_seq'::regclass);
 [   ALTER TABLE public.ss_user_subportfolio ALTER COLUMN ss_user_subportfolio_id DROP DEFAULT;
       public       postgres    false    228    227            �          0    209570 
   cm_contact 
   TABLE DATA               b  COPY public.cm_contact (cm_contact_id, ss_portfolio_id, contact_type, contact_status, contact_created, name, address, ss_country_id, ss_province_id, ss_city_id, ss_district_id, phone_no, email, website, contact_person, contact_phone_no, file_name, path_file, user_input, user_edit, time_input, time_edit, cm_customer_status_id, marketing_id) FROM stdin;
    public       postgres    false    243   w      �          0    209970    cm_contact_person 
   TABLE DATA               �   COPY public.cm_contact_person (cm_contact_person_id, cm_contact_id, name, phone_no, email, user_input, user_edit, time_input, time_edit, "position", descs) FROM stdin;
    public       postgres    false    268          �          0    210436    cm_customer_status 
   TABLE DATA               �   COPY public.cm_customer_status (cm_customer_status_id, ss_portfolio_id, descs, user_input, user_edit, time_input, time_edit, customer_status_cd, customer_status_colour) FROM stdin;
    public       postgres    false    307   "      �          0    210426    cm_customer_status_dtl 
   TABLE DATA               �   COPY public.cm_customer_status_dtl (cm_customer_status_dtl_id, cm_customer_status_id, action, month, freq, user_input, user_edit, time_input, time_edit, action_type) FROM stdin;
    public       postgres    false    305   �"      �          0    209857 	   cm_reason 
   TABLE DATA               �   COPY public.cm_reason (cm_reason_id, ss_portfolio_id, module_cd, reason_cd, descs, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    254   �#      �          0    210301 	   fm_driver 
   TABLE DATA               �   COPY public.fm_driver (fm_driver_id, driver_name, handphone, address, user_input, user_edit, time_input, time_edit, driver_status, remarks) FROM stdin;
    public       postgres    false    294   6$      �          0    210311    fm_driver_doc 
   TABLE DATA               �   COPY public.fm_driver_doc (fm_driver_doc_id, fm_driver_id, doc_type, doc_no, doc_file_name, doc_path_file, expiry_date, user_input, user_edit, time_input, time_edit, driver_status) FROM stdin;
    public       postgres    false    296   |%      �          0    210281    fm_fleet_mstr 
   TABLE DATA               �   COPY public.fm_fleet_mstr (fm_fleet_mstr_id, license_plate_no, fm_fleet_type_id, fm_driver_id, fm_driver_id2, descs, bpkb_no, stnk_no, stnk_expiry_date, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    290   �&      �          0    210291    fm_fleet_mstr_doc 
   TABLE DATA               �   COPY public.fm_fleet_mstr_doc (fm_fleet_mstr_doc_id, fm_fleet_mstr_id, doc_type, doc_no, doc_file_name, doc_path_file, expiry_date, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    292   '      �          0    210261    fm_fleet_type 
   TABLE DATA               �   COPY public.fm_fleet_type (fm_fleet_type_id, fleet_cd, descs, file_name, path_file, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    287   �'      �          0    209675    mk_appointment 
   TABLE DATA               �   COPY public.mk_appointment (mk_appointment_id, cm_contact_id, ss_portfolio_id, action_type, pic, appointment_date, meeting_address, descs, user_input, user_edit, time_input, time_edit, status, cm_contact_person_id, appointment_type) FROM stdin;
    public       postgres    false    246   �(                0    210985    mk_commision_dash 
   TABLE DATA               �   COPY public.mk_commision_dash (mk_commision_dash_id, ss_portfolio_id, user_id, paid_amt, overdue_amt, pending_amt, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    348   �+                0    210975    mk_commision_dash_dt 
   TABLE DATA               �   COPY public.mk_commision_dash_dt (mk_commision_dash_dt_id, ss_portfolio_id, user_id, marketing_id, marketing_name, paid_amt, overdue_amt, pending_amt, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    346   ,      �          0    210480 
   mk_logbook 
   TABLE DATA               �   COPY public.mk_logbook (mk_logbook_id, ss_portfolio_id, cm_contact_id, cm_contact_person_id, appoinment_date, logbook_date, action_type, meeting_address, descs, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    310   v,      �          0    210552    mk_marketing 
   TABLE DATA               �   COPY public.mk_marketing (mk_marketing_id, ss_portfolio_id, user_id, marketing_id, name, nik_id, address, email, hand_phone, status_active, join_date, monthly_point, monthly_new_prospect, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    313   :-      �          0    210713    mk_marketing_target 
   TABLE DATA               �   COPY public.mk_marketing_target (mk_marketing_target_id, marketing_id, years, month, ftl_amt, ltl_amt, project_amt, rental_amt, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    321   ,.      �          0    210793    mk_marketing_target_dash 
   TABLE DATA                  COPY public.mk_marketing_target_dash (mk_marketing_target_dash_id, ss_portfolio_id, user_id, years, months, target_amt, achievement_amt, display_target_amt, display_achievement_amt, display_satuan, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    326   �/      �          0    210814    mk_marketing_target_dash_dt 
   TABLE DATA               $  COPY public.mk_marketing_target_dash_dt (mk_marketing_target_dash_dt_id, ss_portfolio_id, user_id, marketing_id, marketing_name, years, months, target_amt, achievement_amt, display_target_amt, display_achievement_amt, display_satuan, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    328   �0      �          0    210566    mk_marketing_team 
   TABLE DATA               �   COPY public.mk_marketing_team (mk_marketing_team_id, ss_portfolio_id, user_id, parent_marketing_id, child_marketing_id, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    315   �1      �          0    210840    mk_new_prospect_dash 
   TABLE DATA               �   COPY public.mk_new_prospect_dash (mk_new_prospect_dash_id, ss_portfolio_id, user_id, years, months, target_prospect, achievement_prospect, monthly_point_target, monthly_point_achievement, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    331   C2                 0    210863    mk_new_prospect_dash_dt 
   TABLE DATA                 COPY public.mk_new_prospect_dash_dt (mk_new_prospect_dash_dt_id, ss_portfolio_id, user_id, years, months, marketing_id, marketing_name, target_prospect, achievement_prospect, monthly_point_target, monthly_point_achievement, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    333   �2      
          0    210995    mk_open_order 
   TABLE DATA               W  COPY public.mk_open_order (mk_open_order_id, ss_portfolio_id, customer_name, customer_email, customer_phone, customer_contact_person, customer_contact_phone_no, order_no, order_date, order_type, project_name, descs, from_location, to_location, order_amt, start_date, end_date, status, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    350   u3                0    210965    mk_outstanding_payment_dash 
   TABLE DATA               �   COPY public.mk_outstanding_payment_dash (mk_outstanding_payment_dash_id, ss_portfolio_id, user_id, cm_contact_id, customer_name, marketing_id, marketing_name, outstanding_amt, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    344   h4      �          0    209783    mk_quotation 
   TABLE DATA               )  COPY public.mk_quotation (mk_quotation_id, ss_portfolio_id, ss_subportfolio_id, cm_contact_id, quotation_no, quotation_date, quotation_type, project_name, descs, project_value, expired_date, status, user_input, user_edit, time_input, time_edit, reason_cd, reason_descs, chat_topik_id) FROM stdin;
    public       postgres    false    252   5      �          0    210692    mk_spec 
   TABLE DATA               U  COPY public.mk_spec (ss_portfolio_id, action_call_point, action_visit_point, action_entertain_point, working_days_monday, working_days_tuesday, working_days_wednesday, working_days_thursday, working_days_friday, working_days_saturday, working_days_sunday, new_cm_customer_status_id, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    319   7      �          0    209706    mk_todo_list 
   TABLE DATA               �   COPY public.mk_todo_list (mk_todo_list_id, cm_contact_id, action_type, descs, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    248   f7                0    210882    mk_trx_logbook 
   TABLE DATA               �   COPY public.mk_trx_logbook (mk_trx_logbook_id, ss_portfolio_id, logbook_type, referance_no, logbook_date, descs, cm_contact_id, cm_contact_person_id, action_type, meeting_address, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    335   �7      �          0    210000    op_location 
   TABLE DATA               w   COPY public.op_location (op_location_id, location_cd, descs, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    270   v8      �          0    210084 
   op_order_d 
   TABLE DATA               |   COPY public.op_order_d (op_order_d_id, op_order_h_id, descs, qty, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    274   �8      �          0    210069 
   op_order_h 
   TABLE DATA               �  COPY public.op_order_h (op_order_h_id, ss_portfolio_id, ss_subportfolio_id, order_no, order_date, order_status, cm_contact_id, cm_contact_person_id, ref_no, booking_category, contract_no, base_type, base_total, base_pickup, base_rest_of, pickup_from_id, deliver_to_id, pickup_date, extra_pickup_id, extra_deliver_id, truck_type, weight, cubic, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    272   |9      �          0    209908 	   ss_chat_d 
   TABLE DATA               �   COPY public.ss_chat_d (ss_chat_d_id, ss_chat_h_id, chat_text, chat_date, user_id_from, user_id_to, user_input, user_edit, time_input, time_edit, is_read) FROM stdin;
    public       postgres    false    262   f:      �          0    209951    ss_chat_d_read_id 
   TABLE DATA               �   COPY public.ss_chat_d_read_id (ss_chat_d_read_id, ss_chat_d_id, user_id_from, user_id_to, is_read, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    266   <      �          0    209897 	   ss_chat_h 
   TABLE DATA               �   COPY public.ss_chat_h (ss_chat_h_id, ss_portfolio_id, ss_subportfolio_id, subject, user_id_to, doc_date, doc_type, doc_no, user_input, user_edit, time_input, time_edit, user_id_from) FROM stdin;
    public       postgres    false    260   _=      �          0    209374    ss_city 
   TABLE DATA               �   COPY public.ss_city (ss_city_id, ss_province_id, ss_portfolio_id, descs, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    232   �=      �          0    209472 
   ss_country 
   TABLE DATA               �   COPY public.ss_country (ss_country_id, ss_portfolio_id, short_descs, descs, user_input, user_edit, time_input, time_edit, phone_country_code) FROM stdin;
    public       postgres    false    237   #>      �          0    209159    ss_dashboard_group 
   TABLE DATA               �   COPY public.ss_dashboard_group (ss_dashboard_group_id, ss_portfolio_id, ss_group_id, ss_master_dashboard_id, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    200   l>      �          0    209166    ss_define_column 
   TABLE DATA               �   COPY public.ss_define_column (ss_define_column_id, user_id, subportfolio_id, option_url, line_no, column_field, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    202   �>      �          0    209384    ss_district 
   TABLE DATA               �   COPY public.ss_district (ss_district_id, ss_city_id, ss_portfolio_id, descs, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    234   C      �          0    209176    ss_group 
   TABLE DATA               �   COPY public.ss_group (ss_group_id, ss_portfolio_id, descs, short_descs, user_type, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    204   �C      �          0    209183    ss_menu 
   TABLE DATA               �   COPY public.ss_menu (ss_menu_id, title, menu_url, menu_type, parent_menu_id, icon_class, order_seq, ss_module_id, user_input, user_edit, time_input, time_edit, level_no) FROM stdin;
    public       postgres    false    206   wD      �          0    209189    ss_menu_dashboard 
   TABLE DATA               �   COPY public.ss_menu_dashboard (ss_master_dashboard_id, menu_url, title, short_title, order_seq, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    207   �J      �          0    210396    ss_menu_group 
   TABLE DATA               �   COPY public.ss_menu_group (ss_menu_group_id, ss_portfolio_id, ss_menu_id, ss_group_id, add_status, edit_status, delete_status, view_status, post_status, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    302   K      �          0    209210    ss_menu_temp 
   TABLE DATA               �   COPY public.ss_menu_temp (ss_menu_id, title, menu_url, menu_type, parent_menu_id, icon_class, order_seq, ss_module_id, level_no, on_event, user_input, time_input) FROM stdin;
    public       postgres    false    210   3M      �          0    209215 	   ss_module 
   TABLE DATA               s   COPY public.ss_module (ss_module_id, descs, short_descs, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    211   �P                0    211058    ss_notification 
   TABLE DATA               �   COPY public.ss_notification (ss_notification_id, ss_portfolio_id, user_id, notification_date, descs, notification_status, link_url, link_id, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    354   �Q      �          0    209220    ss_option_db 
   TABLE DATA               �   COPY public.ss_option_db (ss_option_db_id, option_url, method_api, sp, line_no, table_name, user_input, user_edit, time_input, time_edit, order_save, method_vue, order_update) FROM stdin;
    public       postgres    false    213   �Q      �          0    209227    ss_option_function 
   TABLE DATA               �   COPY public.ss_option_function (ss_option_function_id, option_function_cd, module_cd, sp_name, sp_param, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    215   �[      �          0    209235    ss_option_lookup 
   TABLE DATA               �   COPY public.ss_option_lookup (ss_option_lookup_id, option_lookup_cd, column_db, view_name, source_field, display_lookup, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    217   �]      �          0    209139    ss_portfolio 
   TABLE DATA               �   COPY public.ss_portfolio (ss_portfolio_id, name, short_name, reference_no, address, city, post_cd, phone_no, fax_no, website, rounding_factor, remarks, picture_file_name, reference_file_name, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    196   )`      �          0    209356    ss_province 
   TABLE DATA               �   COPY public.ss_province (ss_province_id, ss_country_id, ss_portfolio_id, descs, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    230   �a      �          0    210186    ss_running_no 
   TABLE DATA               �   COPY public.ss_running_no (ss_running_no_id, module_cd, form, prepix, digit_no, running_no, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    280   @b      �          0    209884    ss_send_email 
   TABLE DATA               �   COPY public.ss_send_email (ss_send_email_id, ss_portfolio_id, ss_subportfolio_id, sfrom, sto, cc, subject, body, doc_type, doc_no, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    258   �b      �          0    209149    ss_subportfolio 
   TABLE DATA               �  COPY public.ss_subportfolio (ss_subportfolio_id, ss_portfolio_id, name, short_name, subportfolio_start, internal_contact_id, reference_no, address, city, post_cd, phone_no, fax_no, tax_address, tax_city, tax_post_cd, tax_registration_no, tax_registration_date, tax_reference_no, standard_tax_running_cd, common_tax_running_cd, ar_withholding_tax_running_cd, ap_withholding_deduction_running_cd, ap_vat_deduction_running_cd, default_vat_charges_assignment, hold_withholding, hold_vat, remarks, picture_file_name, reference_file_name, website, email, url_picture_map, map_file_name, ref_map_file_name, coordinate, latitude, longitude, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    198   �i      �          0    209243    ss_user 
   TABLE DATA               8  COPY public.ss_user (ss_user_id, user_id, ss_group_id, user_name, password, email, user_level, expired_date, is_inactive, job_title, hand_phone, last_change_password, default_language, user_input, user_edit, portfolio_id, subportfolio_id, time_input, time_edit, file_name, path_file, address, notes) FROM stdin;
    public       postgres    false    219   Yj      �          0    209248    ss_user_favorite 
   TABLE DATA               �   COPY public.ss_user_favorite (ss_user_favorite_id, ss_portfolio_id, user_id, ss_menu_id, user_input, user_edit, time_input, time_edit, row_no) FROM stdin;
    public       postgres    false    220   �n      �          0    209255    ss_user_log 
   TABLE DATA               �   COPY public.ss_user_log (ss_user_log_id, user_id, ip_address, login_date, logout_date, token, is_fraud, captcha, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    222   o      �          0    209264    ss_user_session 
   TABLE DATA               �   COPY public.ss_user_session (user_session_id, user_id, token, last_login, expire_on, ip_address, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    224   }�      �          0    209274    ss_user_subportfolio 
   TABLE DATA               �   COPY public.ss_user_subportfolio (ss_user_subportfolio_id, user_id, subportfolio_id, user_input, user_edit, time_input, time_edit) FROM stdin;
    public       postgres    false    227   u�	      �          0    210832    v_target_amt 
   TABLE DATA               +   COPY public.v_target_amt (sum) FROM stdin;
    public       postgres    false    329   ��	      K           0    0    cm_contact2_cm_contact_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.cm_contact2_cm_contact_id_seq', 10, true);
            public       postgres    false    242            L           0    0 *   cm_contact_person_cm_contact_person_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.cm_contact_person_cm_contact_person_id_seq', 19, true);
            public       postgres    false    267            M           0    0 ,   cm_customer_status_cm_customer_status_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.cm_customer_status_cm_customer_status_id_seq', 26, true);
            public       postgres    false    306            N           0    0 3   cm_customer_status_dtl_cm_customer_status_dt_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.cm_customer_status_dtl_cm_customer_status_dt_id_seq', 24, true);
            public       postgres    false    304            O           0    0     cm_portfolio_cm_portfolio_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.cm_portfolio_cm_portfolio_id_seq', 14, true);
            public       postgres    false    197            P           0    0    cm_reason_cm_reason_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.cm_reason_cm_reason_id_seq', 3, true);
            public       postgres    false    253            Q           0    0 *   cm_subportfolio_new_cm_subportfolio_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.cm_subportfolio_new_cm_subportfolio_id_seq', 1, true);
            public       postgres    false    199            R           0    0 "   fm_driver_doc_fm_driver_doc_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.fm_driver_doc_fm_driver_doc_id_seq', 13, true);
            public       postgres    false    295            S           0    0    fm_driver_fm_driver_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.fm_driver_fm_driver_id_seq', 3, true);
            public       postgres    false    293            T           0    0 *   fm_fleet_mstr_doc_fm_fleet_mstr_doc_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.fm_fleet_mstr_doc_fm_fleet_mstr_doc_id_seq', 5, true);
            public       postgres    false    291            U           0    0 "   fm_fleet_mstr_fm_fleet_mstr_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.fm_fleet_mstr_fm_fleet_mstr_id_seq', 1, true);
            public       postgres    false    289            V           0    0 "   fm_fleet_type_fm_fleet_type_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.fm_fleet_type_fm_fleet_type_id_seq', 3, true);
            public       postgres    false    286            W           0    0 &   mk_appointment_2_mk_appointment_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.mk_appointment_2_mk_appointment_id_seq', 7623, true);
            public       postgres    false    245            X           0    0 0   mk_commision_dash_dt_mk_commision_dash_dt_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.mk_commision_dash_dt_mk_commision_dash_dt_id_seq', 2, true);
            public       postgres    false    345            Y           0    0 *   mk_commision_dash_mk_commision_dash_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.mk_commision_dash_mk_commision_dash_id_seq', 1, true);
            public       postgres    false    347            Z           0    0    mk_logbook_mk_logbook_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.mk_logbook_mk_logbook_id_seq', 3, true);
            public       postgres    false    309            [           0    0     mk_marketing_mk_marketing_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.mk_marketing_mk_marketing_id_seq', 7, true);
            public       postgres    false    312            \           0    0 >   mk_marketing_target_dash_dt_mk_marketing_target_dash_dt_id_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public.mk_marketing_target_dash_dt_mk_marketing_target_dash_dt_id_seq', 336, true);
            public       postgres    false    327            ]           0    0 8   mk_marketing_target_dash_mk_marketing_target_dash_id_seq    SEQUENCE SET     i   SELECT pg_catalog.setval('public.mk_marketing_target_dash_mk_marketing_target_dash_id_seq', 4452, true);
            public       postgres    false    325            ^           0    0 .   mk_marketing_target_mk_marketing_target_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.mk_marketing_target_mk_marketing_target_id_seq', 36, true);
            public       postgres    false    320            _           0    0 *   mk_marketing_team_mk_marketing_team_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.mk_marketing_team_mk_marketing_team_id_seq', 24, true);
            public       postgres    false    314            `           0    0 6   mk_new_prospect_dash_dt_mk_new_prospect_dash_dt_id_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public.mk_new_prospect_dash_dt_mk_new_prospect_dash_dt_id_seq', 16, true);
            public       postgres    false    332            a           0    0 0   mk_new_prospect_dash_mk_new_prospect_dash_id_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.mk_new_prospect_dash_mk_new_prospect_dash_id_seq', 211, true);
            public       postgres    false    330            b           0    0 "   mk_open_order_mk_open_order_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.mk_open_order_mk_open_order_id_seq', 2, true);
            public       postgres    false    349            c           0    0 >   mk_outstanding_payment_dash_mk_outstanding_payment_dash_id_seq    SEQUENCE SET     l   SELECT pg_catalog.setval('public.mk_outstanding_payment_dash_mk_outstanding_payment_dash_id_seq', 4, true);
            public       postgres    false    343            d           0    0     mk_quotation_mk_quotation_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.mk_quotation_mk_quotation_id_seq', 7, true);
            public       postgres    false    251            e           0    0     mk_todo_list_mk_todo_list_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.mk_todo_list_mk_todo_list_id_seq', 1, true);
            public       postgres    false    247            f           0    0 $   mk_trx_logbook_mk_trx_logbook_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.mk_trx_logbook_mk_trx_logbook_id_seq', 3, true);
            public       postgres    false    334            g           0    0    op_location_op_location_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.op_location_op_location_id_seq', 3, true);
            public       postgres    false    269            h           0    0    op_order_d_op_order_d_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.op_order_d_op_order_d_id_seq', 6, true);
            public       postgres    false    273            i           0    0    op_order_h_op_order_h_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.op_order_h_op_order_h_id_seq', 6, true);
            public       postgres    false    271            j           0    0 '   ss_chat_d_read_id_ss_chat_d_read_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.ss_chat_d_read_id_ss_chat_d_read_id_seq', 27, true);
            public       postgres    false    265            k           0    0    ss_chat_d_ss_chat_d_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.ss_chat_d_ss_chat_d_id_seq', 47, true);
            public       postgres    false    261            l           0    0    ss_chat_h_ss_chat_h_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.ss_chat_h_ss_chat_h_id_seq', 6, true);
            public       postgres    false    259            m           0    0    ss_city_ss_city_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ss_city_ss_city_id_seq', 2, true);
            public       postgres    false    231            n           0    0    ss_country_ss_country_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.ss_country_ss_country_id_seq', 2, true);
            public       postgres    false    236            o           0    0 ,   ss_dashboard_group_ss_dashboard_group_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.ss_dashboard_group_ss_dashboard_group_id_seq', 1, false);
            public       postgres    false    201            p           0    0 (   ss_define_column_ss_define_column_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.ss_define_column_ss_define_column_id_seq', 38, true);
            public       postgres    false    203            q           0    0    ss_distric_ss_distric_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.ss_distric_ss_distric_id_seq', 4, true);
            public       postgres    false    233            r           0    0    ss_group_new_ss_group_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.ss_group_new_ss_group_id_seq', 10, true);
            public       postgres    false    205            s           0    0 ,   ss_menu_dashboard_ss_master_dashboard_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.ss_menu_dashboard_ss_master_dashboard_id_seq', 1, false);
            public       postgres    false    208            t           0    0 '   ss_menu_group_new_ss_menu_group_id_seq1    SEQUENCE SET     W   SELECT pg_catalog.setval('public.ss_menu_group_new_ss_menu_group_id_seq1', 474, true);
            public       postgres    false    301            u           0    0    ss_menu_ss_menu_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.ss_menu_ss_menu_id_seq', 82, true);
            public       postgres    false    209            v           0    0    ss_module_ss_module_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.ss_module_ss_module_id_seq', 12, true);
            public       postgres    false    212            w           0    0 &   ss_notification_ss_notification_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.ss_notification_ss_notification_id_seq', 1, false);
            public       postgres    false    353            x           0    0     ss_option_db_ss_option_db_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.ss_option_db_ss_option_db_id_seq', 130, true);
            public       postgres    false    214            y           0    0 ,   ss_option_function_ss_option_function_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.ss_option_function_ss_option_function_id_seq', 15, true);
            public       postgres    false    216            z           0    0 (   ss_option_lookup_ss_option_lookup_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.ss_option_lookup_ss_option_lookup_id_seq', 15, true);
            public       postgres    false    218            {           0    0    ss_province_ss_province_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.ss_province_ss_province_id_seq', 2, true);
            public       postgres    false    229            |           0    0 "   ss_running_no_ss_running_no_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.ss_running_no_ss_running_no_id_seq', 2, true);
            public       postgres    false    279            }           0    0 "   ss_send_email_ss_send_email_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.ss_send_email_ss_send_email_id_seq', 20, true);
            public       postgres    false    257            ~           0    0 ,   ss_user_favorite_new_ss_user_favorite_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.ss_user_favorite_new_ss_user_favorite_id_seq', 7, true);
            public       postgres    false    221                       0    0    ss_user_log_ss_user_log_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.ss_user_log_ss_user_log_id_seq', 602, true);
            public       postgres    false    223            �           0    0 #   ss_user_session_user_session_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.ss_user_session_user_session_id_seq', 519, true);
            public       postgres    false    225            �           0    0    ss_user_ss_user_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.ss_user_ss_user_id_seq', 10, true);
            public       postgres    false    226            �           0    0 0   ss_user_subportfolio_ss_user_subportfolio_id_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.ss_user_subportfolio_ss_user_subportfolio_id_seq', 1, false);
            public       postgres    false    228            �           2606    209582    cm_contact cm_contact2_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.cm_contact
    ADD CONSTRAINT cm_contact2_pkey PRIMARY KEY (cm_contact_id, ss_portfolio_id);
 E   ALTER TABLE ONLY public.cm_contact DROP CONSTRAINT cm_contact2_pkey;
       public         postgres    false    243    243            �           2606    209977 (   cm_contact_person cm_contact_person_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.cm_contact_person
    ADD CONSTRAINT cm_contact_person_pkey PRIMARY KEY (cm_contact_id, cm_contact_person_id);
 R   ALTER TABLE ONLY public.cm_contact_person DROP CONSTRAINT cm_contact_person_pkey;
       public         postgres    false    268    268            �           2606    210433 2   cm_customer_status_dtl cm_customer_status_dtl_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.cm_customer_status_dtl
    ADD CONSTRAINT cm_customer_status_dtl_pkey PRIMARY KEY (cm_customer_status_dtl_id);
 \   ALTER TABLE ONLY public.cm_customer_status_dtl DROP CONSTRAINT cm_customer_status_dtl_pkey;
       public         postgres    false    305            �           2606    210443 *   cm_customer_status cm_customer_status_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.cm_customer_status
    ADD CONSTRAINT cm_customer_status_pkey PRIMARY KEY (cm_customer_status_id);
 T   ALTER TABLE ONLY public.cm_customer_status DROP CONSTRAINT cm_customer_status_pkey;
       public         postgres    false    307            �           2606    209304    ss_portfolio cm_portfolio_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ss_portfolio
    ADD CONSTRAINT cm_portfolio_pkey PRIMARY KEY (name);
 H   ALTER TABLE ONLY public.ss_portfolio DROP CONSTRAINT cm_portfolio_pkey;
       public         postgres    false    196            �           2606    209864    cm_reason cm_reason_key 
   CONSTRAINT     x   ALTER TABLE ONLY public.cm_reason
    ADD CONSTRAINT cm_reason_key PRIMARY KEY (ss_portfolio_id, module_cd, reason_cd);
 A   ALTER TABLE ONLY public.cm_reason DROP CONSTRAINT cm_reason_key;
       public         postgres    false    254    254    254            �           2606    209306 :   ss_subportfolio cm_subportfolio_cm_new_subportfolio_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ss_subportfolio
    ADD CONSTRAINT cm_subportfolio_cm_new_subportfolio_id_key PRIMARY KEY (ss_subportfolio_id);
 d   ALTER TABLE ONLY public.ss_subportfolio DROP CONSTRAINT cm_subportfolio_cm_new_subportfolio_id_key;
       public         postgres    false    198            �           2606    210318     fm_driver_doc fm_driver_doc_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.fm_driver_doc
    ADD CONSTRAINT fm_driver_doc_pkey PRIMARY KEY (fm_driver_doc_id);
 J   ALTER TABLE ONLY public.fm_driver_doc DROP CONSTRAINT fm_driver_doc_pkey;
       public         postgres    false    296            �           2606    210308    fm_driver fm_driver_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.fm_driver
    ADD CONSTRAINT fm_driver_pkey PRIMARY KEY (fm_driver_id);
 B   ALTER TABLE ONLY public.fm_driver DROP CONSTRAINT fm_driver_pkey;
       public         postgres    false    294            �           2606    210298 (   fm_fleet_mstr_doc fm_fleet_mstr_doc_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.fm_fleet_mstr_doc
    ADD CONSTRAINT fm_fleet_mstr_doc_pkey PRIMARY KEY (fm_fleet_mstr_doc_id);
 R   ALTER TABLE ONLY public.fm_fleet_mstr_doc DROP CONSTRAINT fm_fleet_mstr_doc_pkey;
       public         postgres    false    292            �           2606    210288     fm_fleet_mstr fm_fleet_mstr_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.fm_fleet_mstr
    ADD CONSTRAINT fm_fleet_mstr_pkey PRIMARY KEY (license_plate_no);
 J   ALTER TABLE ONLY public.fm_fleet_mstr DROP CONSTRAINT fm_fleet_mstr_pkey;
       public         postgres    false    290            �           2606    210268     fm_fleet_type fm_fleet_type_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.fm_fleet_type
    ADD CONSTRAINT fm_fleet_type_pkey PRIMARY KEY (fleet_cd);
 J   ALTER TABLE ONLY public.fm_fleet_type DROP CONSTRAINT fm_fleet_type_pkey;
       public         postgres    false    287            �           2606    209687 &   mk_appointment mk_appointment_new_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.mk_appointment
    ADD CONSTRAINT mk_appointment_new_pkey PRIMARY KEY (mk_appointment_id);
 P   ALTER TABLE ONLY public.mk_appointment DROP CONSTRAINT mk_appointment_new_pkey;
       public         postgres    false    246            �           2606    210982 .   mk_commision_dash_dt mk_commision_dash_dt_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mk_commision_dash_dt
    ADD CONSTRAINT mk_commision_dash_dt_pkey PRIMARY KEY (mk_commision_dash_dt_id);
 X   ALTER TABLE ONLY public.mk_commision_dash_dt DROP CONSTRAINT mk_commision_dash_dt_pkey;
       public         postgres    false    346            �           2606    210992 (   mk_commision_dash mk_commision_dash_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.mk_commision_dash
    ADD CONSTRAINT mk_commision_dash_pkey PRIMARY KEY (mk_commision_dash_id);
 R   ALTER TABLE ONLY public.mk_commision_dash DROP CONSTRAINT mk_commision_dash_pkey;
       public         postgres    false    348            �           2606    210490    mk_logbook mk_logbook_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.mk_logbook
    ADD CONSTRAINT mk_logbook_pkey PRIMARY KEY (mk_logbook_id);
 D   ALTER TABLE ONLY public.mk_logbook DROP CONSTRAINT mk_logbook_pkey;
       public         postgres    false    310            �           2606    210563    mk_marketing mk_marketing_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mk_marketing
    ADD CONSTRAINT mk_marketing_pkey PRIMARY KEY (ss_portfolio_id, user_id, marketing_id);
 H   ALTER TABLE ONLY public.mk_marketing DROP CONSTRAINT mk_marketing_pkey;
       public         postgres    false    313    313    313            �           2606    210824 <   mk_marketing_target_dash_dt mk_marketing_target_dash_dt_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mk_marketing_target_dash_dt
    ADD CONSTRAINT mk_marketing_target_dash_dt_pkey PRIMARY KEY (mk_marketing_target_dash_dt_id);
 f   ALTER TABLE ONLY public.mk_marketing_target_dash_dt DROP CONSTRAINT mk_marketing_target_dash_dt_pkey;
       public         postgres    false    328            �           2606    210800 6   mk_marketing_target_dash mk_marketing_target_dash_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mk_marketing_target_dash
    ADD CONSTRAINT mk_marketing_target_dash_pkey PRIMARY KEY (mk_marketing_target_dash_id);
 `   ALTER TABLE ONLY public.mk_marketing_target_dash DROP CONSTRAINT mk_marketing_target_dash_pkey;
       public         postgres    false    326            �           2606    210720 ,   mk_marketing_target mk_marketing_target_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mk_marketing_target
    ADD CONSTRAINT mk_marketing_target_pkey PRIMARY KEY (marketing_id, years, month);
 V   ALTER TABLE ONLY public.mk_marketing_target DROP CONSTRAINT mk_marketing_target_pkey;
       public         postgres    false    321    321    321            �           2606    210573 (   mk_marketing_team mk_marketing_team_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.mk_marketing_team
    ADD CONSTRAINT mk_marketing_team_pkey PRIMARY KEY (mk_marketing_team_id);
 R   ALTER TABLE ONLY public.mk_marketing_team DROP CONSTRAINT mk_marketing_team_pkey;
       public         postgres    false    315            �           2606    210870 4   mk_new_prospect_dash_dt mk_new_prospect_dash_dt_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mk_new_prospect_dash_dt
    ADD CONSTRAINT mk_new_prospect_dash_dt_pkey PRIMARY KEY (mk_new_prospect_dash_dt_id);
 ^   ALTER TABLE ONLY public.mk_new_prospect_dash_dt DROP CONSTRAINT mk_new_prospect_dash_dt_pkey;
       public         postgres    false    333            �           2606    210847 .   mk_new_prospect_dash mk_new_prospect_dash_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mk_new_prospect_dash
    ADD CONSTRAINT mk_new_prospect_dash_pkey PRIMARY KEY (mk_new_prospect_dash_id);
 X   ALTER TABLE ONLY public.mk_new_prospect_dash DROP CONSTRAINT mk_new_prospect_dash_pkey;
       public         postgres    false    331            �           2606    211005     mk_open_order mk_open_order_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.mk_open_order
    ADD CONSTRAINT mk_open_order_pkey PRIMARY KEY (mk_open_order_id);
 J   ALTER TABLE ONLY public.mk_open_order DROP CONSTRAINT mk_open_order_pkey;
       public         postgres    false    350            �           2606    210972 <   mk_outstanding_payment_dash mk_outstanding_payment_dash_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mk_outstanding_payment_dash
    ADD CONSTRAINT mk_outstanding_payment_dash_pkey PRIMARY KEY (mk_outstanding_payment_dash_id);
 f   ALTER TABLE ONLY public.mk_outstanding_payment_dash DROP CONSTRAINT mk_outstanding_payment_dash_pkey;
       public         postgres    false    344            �           2606    209790    mk_quotation mk_quotation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.mk_quotation
    ADD CONSTRAINT mk_quotation_pkey PRIMARY KEY (quotation_no, ss_portfolio_id, ss_subportfolio_id);
 H   ALTER TABLE ONLY public.mk_quotation DROP CONSTRAINT mk_quotation_pkey;
       public         postgres    false    252    252    252            �           2606    210705    mk_spec mk_spec_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.mk_spec
    ADD CONSTRAINT mk_spec_pkey PRIMARY KEY (ss_portfolio_id);
 >   ALTER TABLE ONLY public.mk_spec DROP CONSTRAINT mk_spec_pkey;
       public         postgres    false    319            �           2606    209713    mk_todo_list mk_todo_list_key 
   CONSTRAINT     h   ALTER TABLE ONLY public.mk_todo_list
    ADD CONSTRAINT mk_todo_list_key PRIMARY KEY (mk_todo_list_id);
 G   ALTER TABLE ONLY public.mk_todo_list DROP CONSTRAINT mk_todo_list_key;
       public         postgres    false    248            �           2606    210891 "   mk_trx_logbook mk_trx_logbook_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.mk_trx_logbook
    ADD CONSTRAINT mk_trx_logbook_pkey PRIMARY KEY (mk_trx_logbook_id);
 L   ALTER TABLE ONLY public.mk_trx_logbook DROP CONSTRAINT mk_trx_logbook_pkey;
       public         postgres    false    335            �           2606    210007    op_location op_location_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.op_location
    ADD CONSTRAINT op_location_key PRIMARY KEY (op_location_id);
 E   ALTER TABLE ONLY public.op_location DROP CONSTRAINT op_location_key;
       public         postgres    false    270            �           2606    210091    op_order_d op_order_d_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.op_order_d
    ADD CONSTRAINT op_order_d_pkey PRIMARY KEY (op_order_d_id);
 D   ALTER TABLE ONLY public.op_order_d DROP CONSTRAINT op_order_d_pkey;
       public         postgres    false    274            �           2606    210081    op_order_h op_order_h_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.op_order_h
    ADD CONSTRAINT op_order_h_pkey PRIMARY KEY (ss_portfolio_id, ss_subportfolio_id, order_no);
 D   ALTER TABLE ONLY public.op_order_h DROP CONSTRAINT op_order_h_pkey;
       public         postgres    false    272    272    272            �           2606    209919    ss_chat_d ss_chat_d_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.ss_chat_d
    ADD CONSTRAINT ss_chat_d_key PRIMARY KEY (ss_chat_d_id);
 A   ALTER TABLE ONLY public.ss_chat_d DROP CONSTRAINT ss_chat_d_key;
       public         postgres    false    262            �           2606    209958 $   ss_chat_d_read_id ss_chat_d_read_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.ss_chat_d_read_id
    ADD CONSTRAINT ss_chat_d_read_key PRIMARY KEY (ss_chat_d_read_id);
 N   ALTER TABLE ONLY public.ss_chat_d_read_id DROP CONSTRAINT ss_chat_d_read_key;
       public         postgres    false    266            �           2606    209905    ss_chat_h ss_chat_h_key 
   CONSTRAINT     ~   ALTER TABLE ONLY public.ss_chat_h
    ADD CONSTRAINT ss_chat_h_key PRIMARY KEY (ss_portfolio_id, ss_subportfolio_id, doc_no);
 A   ALTER TABLE ONLY public.ss_chat_h DROP CONSTRAINT ss_chat_h_key;
       public         postgres    false    260    260    260            �           2606    209381    ss_city ss_city_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.ss_city
    ADD CONSTRAINT ss_city_pkey PRIMARY KEY (ss_city_id, ss_province_id, ss_portfolio_id);
 >   ALTER TABLE ONLY public.ss_city DROP CONSTRAINT ss_city_pkey;
       public         postgres    false    232    232    232            �           2606    209479    ss_country ss_country_new_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.ss_country
    ADD CONSTRAINT ss_country_new_pkey PRIMARY KEY (ss_country_id);
 H   ALTER TABLE ONLY public.ss_country DROP CONSTRAINT ss_country_new_pkey;
       public         postgres    false    237            �           2606    209308 *   ss_dashboard_group ss_dashboard_group_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ss_dashboard_group
    ADD CONSTRAINT ss_dashboard_group_pkey PRIMARY KEY (ss_portfolio_id, ss_group_id, ss_master_dashboard_id);
 T   ALTER TABLE ONLY public.ss_dashboard_group DROP CONSTRAINT ss_dashboard_group_pkey;
       public         postgres    false    200    200    200            �           2606    210252 9   ss_define_column ss_define_column_ss_define_column_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ss_define_column
    ADD CONSTRAINT ss_define_column_ss_define_column_id_key PRIMARY KEY (user_id, subportfolio_id, option_url, line_no);
 c   ALTER TABLE ONLY public.ss_define_column DROP CONSTRAINT ss_define_column_ss_define_column_id_key;
       public         postgres    false    202    202    202    202            �           2606    209391    ss_district ss_distric_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ss_district
    ADD CONSTRAINT ss_distric_pkey PRIMARY KEY (ss_district_id, ss_city_id, ss_portfolio_id);
 E   ALTER TABLE ONLY public.ss_district DROP CONSTRAINT ss_distric_pkey;
       public         postgres    false    234    234    234            �           2606    209312    ss_group ss_group_new_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.ss_group
    ADD CONSTRAINT ss_group_new_pkey PRIMARY KEY (ss_group_id);
 D   ALTER TABLE ONLY public.ss_group DROP CONSTRAINT ss_group_new_pkey;
       public         postgres    false    204            �           2606    209314 *   ss_menu_dashboard ss_master_dashboard_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.ss_menu_dashboard
    ADD CONSTRAINT ss_master_dashboard_pkey PRIMARY KEY (menu_url, order_seq);
 T   ALTER TABLE ONLY public.ss_menu_dashboard DROP CONSTRAINT ss_master_dashboard_pkey;
       public         postgres    false    207    207            �           2606    210408 %   ss_menu_group ss_menu_group_new2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ss_menu_group
    ADD CONSTRAINT ss_menu_group_new2_pkey PRIMARY KEY (ss_portfolio_id, ss_menu_id, ss_group_id);
 O   ALTER TABLE ONLY public.ss_menu_group DROP CONSTRAINT ss_menu_group_new2_pkey;
       public         postgres    false    302    302    302            �           2606    209318    ss_menu ss_menu_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ss_menu
    ADD CONSTRAINT ss_menu_pkey PRIMARY KEY (ss_menu_id);
 >   ALTER TABLE ONLY public.ss_menu DROP CONSTRAINT ss_menu_pkey;
       public         postgres    false    206            �           2606    209320    ss_module ss_module_id_key 
   CONSTRAINT     b   ALTER TABLE ONLY public.ss_module
    ADD CONSTRAINT ss_module_id_key PRIMARY KEY (ss_module_id);
 D   ALTER TABLE ONLY public.ss_module DROP CONSTRAINT ss_module_id_key;
       public         postgres    false    211            �           2606    211065 $   ss_notification ss_notification_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.ss_notification
    ADD CONSTRAINT ss_notification_pkey PRIMARY KEY (ss_notification_id);
 N   ALTER TABLE ONLY public.ss_notification DROP CONSTRAINT ss_notification_pkey;
       public         postgres    false    354            �           2606    209322    ss_option_db ss_option_db_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.ss_option_db
    ADD CONSTRAINT ss_option_db_pkey PRIMARY KEY (ss_option_db_id);
 H   ALTER TABLE ONLY public.ss_option_db DROP CONSTRAINT ss_option_db_pkey;
       public         postgres    false    213            �           2606    209324 <   ss_option_function ss_option_function_option_function_cd_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ss_option_function
    ADD CONSTRAINT ss_option_function_option_function_cd_key UNIQUE (option_function_cd);
 f   ALTER TABLE ONLY public.ss_option_function DROP CONSTRAINT ss_option_function_option_function_cd_key;
       public         postgres    false    215            �           2606    209326 ?   ss_option_function ss_option_function_ss_option_function_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ss_option_function
    ADD CONSTRAINT ss_option_function_ss_option_function_id_key PRIMARY KEY (ss_option_function_id);
 i   ALTER TABLE ONLY public.ss_option_function DROP CONSTRAINT ss_option_function_ss_option_function_id_key;
       public         postgres    false    215            �           2606    209328 9   ss_option_lookup ss_option_lookup_ss_option_lookup_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ss_option_lookup
    ADD CONSTRAINT ss_option_lookup_ss_option_lookup_id_key PRIMARY KEY (ss_option_lookup_id);
 c   ALTER TABLE ONLY public.ss_option_lookup DROP CONSTRAINT ss_option_lookup_ss_option_lookup_id_key;
       public         postgres    false    217            �           2606    209363     ss_province ss_province_new_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ss_province
    ADD CONSTRAINT ss_province_new_pkey PRIMARY KEY (ss_province_id, ss_country_id, ss_portfolio_id);
 J   ALTER TABLE ONLY public.ss_province DROP CONSTRAINT ss_province_new_pkey;
       public         postgres    false    230    230    230            �           2606    210193    ss_running_no ss_running_no_key 
   CONSTRAINT     j   ALTER TABLE ONLY public.ss_running_no
    ADD CONSTRAINT ss_running_no_key PRIMARY KEY (module_cd, form);
 I   ALTER TABLE ONLY public.ss_running_no DROP CONSTRAINT ss_running_no_key;
       public         postgres    false    280    280            �           2606    209894     ss_send_email ss_send_email_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ss_send_email
    ADD CONSTRAINT ss_send_email_pkey PRIMARY KEY (ss_send_email_id);
 J   ALTER TABLE ONLY public.ss_send_email DROP CONSTRAINT ss_send_email_pkey;
       public         postgres    false    258            �           2606    209330 *   ss_user_favorite ss_user_favorite_new_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ss_user_favorite
    ADD CONSTRAINT ss_user_favorite_new_pkey PRIMARY KEY (ss_portfolio_id, user_id, ss_menu_id);
 T   ALTER TABLE ONLY public.ss_user_favorite DROP CONSTRAINT ss_user_favorite_new_pkey;
       public         postgres    false    220    220    220            �           2606    209332 *   ss_user_log ss_user_log_ss_user_log_id_key 
   CONSTRAINT     t   ALTER TABLE ONLY public.ss_user_log
    ADD CONSTRAINT ss_user_log_ss_user_log_id_key PRIMARY KEY (ss_user_log_id);
 T   ALTER TABLE ONLY public.ss_user_log DROP CONSTRAINT ss_user_log_ss_user_log_id_key;
       public         postgres    false    222            �           2606    209334 6   ss_user_session ss_user_session_ss_user_session_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ss_user_session
    ADD CONSTRAINT ss_user_session_ss_user_session_id_key PRIMARY KEY (user_session_id);
 `   ALTER TABLE ONLY public.ss_user_session DROP CONSTRAINT ss_user_session_ss_user_session_id_key;
       public         postgres    false    224            �           2606    209336    ss_user ss_user_ss_user_id_key 
   CONSTRAINT     d   ALTER TABLE ONLY public.ss_user
    ADD CONSTRAINT ss_user_ss_user_id_key PRIMARY KEY (ss_user_id);
 H   ALTER TABLE ONLY public.ss_user DROP CONSTRAINT ss_user_ss_user_id_key;
       public         postgres    false    219            �           2606    209338 .   ss_user_subportfolio ss_user_subportfolio_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ss_user_subportfolio
    ADD CONSTRAINT ss_user_subportfolio_pkey PRIMARY KEY (user_id, subportfolio_id);
 X   ALTER TABLE ONLY public.ss_user_subportfolio DROP CONSTRAINT ss_user_subportfolio_pkey;
       public         postgres    false    227    227            �           2606    209340    ss_user ss_user_user_id_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.ss_user
    ADD CONSTRAINT ss_user_user_id_key UNIQUE (user_id);
 E   ALTER TABLE ONLY public.ss_user DROP CONSTRAINT ss_user_user_id_key;
       public         postgres    false    219            �   �  x�}U]s�:}�Bשּ>��xJ�޶I_O���3�[1C3+ARB����j���YI!��h�adBĄ�H"xB$Z�s���{1��R��Mb�'��P�jz�����r����ám:�0A�v��H%c��Iw~�e�j㘈��D$Ѝ�d����¢�24_��b���r�?ٵ�M����,��5hZn��SBI��yű1���U�q�ɴ���O�X�s��������r�!��{J��q��_��6�~��Ҥ��ͷ�Rr����^T�ڻ�����o�I'L�4� zCC4a��&�%d���[t�����-�4U��Ƴ2��~!!x�ro�m������'gg��� ����4k��)�����=ڴLa�dp&)gTJEuļ���{Ә�\Ѐ�s������S���fm�]SxZ��"�@wMj��)�e^n���P1�ܯս��v� �����l�8m�'�:�u�3�<�������z%��/9�*��T�&ǃؤk�r�=h�����~àk���h��N��	)�;�С�m�X����]���m7�����|Y��7%�;����(��wJHk�~�	�	��;E.�i_S
s�C[|����i�t=�����:Ip�c@��c�Ff3�	�b�)��
��I����H���S�E")��=��	'	�}X`c:�Q��l��b`��4�<�l�m(�E([ȗ�m������41�,T�$.l�`�j���O�r���^zc6��r���E�is��]V��sm����ϔ��'��}
�:��!�j9�zA_�M��R�<��t�lE�CJ�Fѧ,=���n��D�iհ�W�d|��	lޔ1q!�:��`�UY�fU{'���o,���=hIh�Y]-� ��j      �   �  x���Ok�0���O�{q���a	M��B�@.���l�k�X���W��fCS[:���~oF#�o��iñ{�|R���h������vG�?�����y6(�5��-j�WqUt���`��B*m�n���jd.-,j����_kPZ�����O^2ٝj�:F���o�@;���aB�U���v�{_��ԎةF�I��%7C�p����99ӱy�������\�(��󍦜0���Adܶï����~;�|�v�aW��5Z��Z��psq}�������	b�i�5\Xc���!2>,D5;E�(S�KZ��FT�ӿ�M�F	�_y�?�qTmQ� 	b�����E.Ħ�^�~��#��E-S��I�|$�j�S^�8/j�]�&�7��i|n�A�� v󝱩�9��E-�h|��0��]��I\hKIJ!c}%�:��6����U���>�|�&�^b�t׸y�ko5?�~��PݟUU�<�'�      �   �   x�u��
�@ 뽯8���Ëf;IL)66b�B��%��7�Q|��ì���Cu�N�Ș�K8��PIU��9VA�B���Q�]�>~X҄Т�x4��b9����l��C��K�}iP,e*��^li�IY`���N�5������C��V?Y^ ��.�4D�kC�����.�]�Lr�v0[o
�"s�c�P}      �   �   x��ѱ
�0��9�����h�*y�.Buh����m�*:�|��UV��0(R�j���02�hs�24βӘ��Pȼ�}�=�7P��O�{�����Ms�x�� �^�ˌ�19��[�e�PxC�4@F+�>QJ��X,�W!ʨ��k�Vc|0ۯ�Wh�)����9Z����?L�[�6y������{��X�Ř%� � ���|      �   n   x�3�4����t���u�q��R�P����@��D��R������������΀̼�������|f�[�`�2���4�)1/=����9�n�q��qqq x�0A      �   6  x�e��n�0���S�Ze)])\�-z�͐?�TM�?&mҀ�G��G���qƗ�vW�9���	�N��Ҽ-g�=���]��ޝ{����xm��0��6�,_���kg/&�2�!����'>���wp������_�S���������4�@u�oh*q�@�D\�?�`�J�Nr��� ��q-bH�Y�Ȟ�+eF�?���Ր%��gԐ&��m
�ϸ�t�W��Rz�����R�[`�Xy��5�ī�ZF���y�0L�����l��,8p&)� ���ԁ䜚أn^o�3�͖X������:�      �   	  x����j�0���)�23#Y�o�.PS\Hz�ũ�q��"��j�h�FI��$Ƃ�9̑�cvM}� ��(0lf��PP7�a��c�Y���(�%�,�0�P�h�[�iض�ح�[X�uSUw�/U��a͙ee:e��}'J�����os�`��?�.}~}�`��Jk$�ƙtF�)����智����X,t�����i�e팕h�<���)%�D�p\���O��z��T����њ���H�k�\UUi�$��^�`      �   v   x�M���@C��W�����f��HX*]�H��E{��b[��S��p!�m4^���e]|+�i�yy=I����ܦh*����10�54�wE�u���y��N�)�O!���&      �   �   x���?k�@�g�Sxl�3�c�t���4%��!p1!�i��~�^]��yH��C�x/@,�Z�DD�4��y���8l������x��$����Fc�9�(0�����y^F.7kƎc���W�cɣi+L\�V�����},��zI��kN�0C)hl�s�L���`Z�V����?�?ި��%i4�dt�H���IrSU�8?b�      �   �   x�}ͱ�0��}
_ r{{m74� ���u!������� �Y���,��`qy)�mz�ط,�wM9vCU;wJ�d��) �F�,��~.C@�@yB� -Kf�q�-dQ��ّU}��MO�0�i�-�����I��>J١?ӫ��y�4(�!D����)a�p�sο?�SH      �   �  x����n�@���S������R7�Ԥ���R�\66u�1D*�O��aq��R��ȇ����ovv� adE���c��&�r��т���ZJ-�w�1�~�-���!�<�*���mE��l���c,	)�R�H��<ؿ@��%�d���i&T3�#J��W�_u�o�uQ��y�v�=H��}�R_l +?8u�r
�f[Lӥ�._�)@�!��~��%�a�҂[�m��U�~S�yӚ���U;��b_l`G~�qȅ�	�ٹ�Cȸ���u��@M��j옥�L��.���1�����3f��0�j��;��y[L���b��ػn��zN5Ȯ��ɐM�6f�����ŎL�����k��	�n�n�f걙����c�Y2���<��zhq��8_����"�(19�2!;�3p�vi�&?���MW�~���;:��R���z�R��NK����Ք%�Q	�1�l6v��|[s(F~�B��d���b�4e��z��M����u�&O-()��x�e�ׁ����#�x�)g �� �i.�����x,��cS!�[ YZ�X���T�7vGX��L��c<-���+�=�������jycY�X�x,}�.�]�~��_,�O�[G~��ǥů��1)bVo`V��߭����j_�A�2w�� ��푽v��k��H���'�H2{�^;F틵�Q���'��ڟ{�P��/�~�y>]3������E�Ww�����r�� �s�b         >   x�3�4�LL��4313 =�i��56F�4��������������������61�=... W�c         `   x�3�4�LL���M,2�tK-�T�,J,O��4426 =�i��5F�L a##]3]Cs#C+#s+Sclb\�[9Sr3�8M�Z`H�u1z\\\ D�0�      �   �   x�m�M
�@�יS��dF[:Ku%.Dĕ���U����N�ց�@������	�A����H'�d}�4���XJa+)�­<7R]�:��'���5m��eWt��3ȱ|)�(����x�C�c$�F[N�,�4�@�������gL��a:j���=c�>��a)u�����[	:~�L&J�'\Q�      �   �   x������ ��{_���Sӎ�t:�.��tٍCJ	!��!_�n:X��r�p	�n�o�4��;8�q��+�f$)�	�ᦏ��*�e��!Z[�kY��yr�]ߠ�@Q@S%�����PBۻ배/��?�<u��[>��kTf��u@��CD�|�L77�9m�#P���J&�:p��3rڋ_�޿X�	�*����p�]���L3+c#�<]�R%��y��w��c      �   a  x���An� E�p�^ �� ��A7�����_Ա�菅+�KY��?�������cGW���p��^�ǧ����u
�Z󢀖����] ��+�SWt @k_4:�E�K_t t틎��Y��c�<�#��rG�_aZ����Pס�
(L��$�5/ x|���Y���!�!�h��om!� :m���5$0$WZ���N�
��B4��{�� � ���(ByKP@P\j!�QA���س9y�0d���Z���bd�����d�<OjK񬁜T,Y�m;:��H'.�5�2F�@�(��V�*2(�E��QTP�!
!PF(u�B0z4�a��c��K�p|^��� ���      �   �   x���;� @gs�^ �m��s�.����k	�
K�C!6?=�FD��702��Ϗ��\�d�5���v�w������x8>����Έ��H�M"m�L�K"e���H�g-B!��
K�#�_!#H�Ȱ���H_-��Y��#w�X,�R��"��?T�Q�+mêt�]��=*�ő��(�j�j}�[k�K?/�L:͒^�]!U�7�|g<�Ƙd���      �   L  x����n�0���S��ۘl]*�R��]�ҡC:�T}�b �@���K`l�>�㢃���^ێ��z��F�~�pj�t{���ؿ�ۤ+�?b8�(�ş=��*!�'�����9\���]X`�;00�zރ>�Ӫ�b�9ࡧuj�^���Ez7֞r���F�wӋW�ق~��uz!mM�9���L
�߃����H.� Z�R/�A_N�0���k�Ҁ�z��~��F��v54c��Rc ��\�Ҋm9�"�A�y����Tk6��r����U5P��pK�rn�e%�LYi��zL�-y�9����F?�r�ZDo�[Ψ^{
)gR離�~f�]�      �   J   x�34�4�LL���M,2� ���X([�Z�c�22A3��C#+S+Cclb\1z\\\ ���      �      x���;
�@Dk�{}wm"'pH���1^� ����1*��|�AH|���9��?��h}�Չ[!
�p������r�����f�F�ޛmC�Qm7�LCa����z��E����1�fD� 5�Y�          �   x���;�0 ��>E.��v� �X��K�20�!���"F--x�G���!w=	��)�}�_o�-�JA��R�q�6��#J������p���;�|�oO>=��c��q���4�j��"�m�����9.��k�ya���[D|��Z�      
   �   x���QK�0ǟ/�"��i�'Wˆ
Z�^_�6B�5�t�����d��.���?�! Tۄ/wu���u}�5��-��J���E�P�\e���c����K�߅�I�Bf�Ki�+xr��:�w��P��ă��}���q������a��LL�a�1��~��%0�2�h,�9��G��+'�]Ӟ��u�+ˋ������T����9Qu.�t�(��Ʀj��ׄ1�f�o         �   x��Ͻ
�@�9��-I�a�V�A��zG=�W9��kKA���Oȏ�� ���V��*�9�	N�cZ��1�<��f*K.�e���	���W	F��K+�~�o��9�����i�oG ����y��4˗0����f��0���!.a.�R��q^�      �   �  x���M��0���W̭��!�Bn�j��n{1�.��Ni�}'��6�D�x>��1a��4�CY �&�ȆlL�S�X@¦�0�Q�ksh��ϔ����℅O}��b�2!��k�$��C��$�4�?�� NXw�y�	�?y��|�(~�ky^=ϴ�w�@16��x�ΰ�2��!���H�5l���	#y�<�f�?*bK�-_>��ԑ�[j�=��q2� ���r�/[��L�������I�$��=ӷ_hN���~��8�6�ꋇ�ǒ U�lp�}�I���t�My7�������;wN�#|-m�@Z�R�yY�TN�vP� wP���G�:W��
��Rg�u�A�ԉ[8�}�=��w��M���L�T�h�j���0�DUuq�W tEqG���t�lj�:�"�0?��uߖ"�
+0}tH;��Q�������xq+D�vØ6�@c���;������J�S3���`0��tm      �   <   x�3�4�4�H8�B�Ĕ\06202�50�54P00�2��25@3�26�2������ 0jI      �   I   x�3�4�t�,I-V��+N-*Q(�O�W(-HI,I�LL�c##]]#s+Cs+cC41Ss+Cc�=... �h�         �   x����
�@�u�+�V2i�tf'�����t�K�����"�P5��%�p%H��1=�8��<
=�T�CC��MmL��v��ھĬ�4]C ��f�i��4����2�?a�F8�]�W��]S���<m.��ǯ=U��e����+D��,�z.���I:      �   a   x�3�����r�v
q�t��FF�����
�V��V��ĸ�8�\�9��RJ���`b�M�˘3�)�3��(1)�2��f�ĸb���� �+�      �   �   x����
�PE��+��$�%U���[�.b7q�_E,�'��,���%��v?_<3�N���H#ި&h��}�1�[���xq����!�D�f��؊7��9u���ڵe����]����=Ծ�ÞZf~ 2nL      �   �   x�u���0 �s�� ���ތ�ɀAc<x1���_�6�!�.M�����n��02��J��I�
9蠁��XЍ���*�A�X��O���Z0L�О����x�5�W/�O��[�z�i��;fN7:u��]�x��B�W��?�8v�#4��;��,N�X�k�0��~�!�f���n�H�[8xrY�9���P4�����Ά��*��Vc^49a�      �   �  x���Mn�0���)| R�?�A7��.�qEhQE@�������F�2F�<&vt�|��ۈ�f��Բ��QF(Oʑu��񾊫m�y]x�NUԎ��@�Uq�~��=I�C�WF�gBO���)^aiIR��l�5`͟X�����c�~X��G^�{ߘ�H�j���1���.|Z���)j����7��9C<�Z-�HK���'�s�u���f�.j�i����bZ��\Z��7"�3E1bT������0|=[?g�P(&��X>�&+ɩ7l��O5��6ۖ��Q��Gm][�Jn
vjF��,�4��2��Ϩb��l�mspG�QEGx�%`��]� fTё�T�4���0+;��t�K���f9��	�$cɨe���F�)_����]]�_rtF}      �   =  x���;n�0Dk�{�HY�n�&�"e� A�t{��Z*}�B�0�Ø3�=�
_߿p�x�G��ˑ����z#�H����$���������hH$-#�6w��|KCf�8�����5��z<w��Q�9N�%і�Z�����:��/�4��|�)�4te��t0����ki��/6�T����؃���hHr泆���?�]I��$}`�ͮ�yihi�T���Y���Z�G����?����T���;�-W~�����|�-���ګ8�a}���:�/�uii�|���y�?��N���S'��%�(]���^�?_�l�Q�      �   [   x�3�4�����Ē��<�|=��P0�LL��������4202�50�54V04�24�22�,���D��c$�FP��Āj�b���� d��      �   I   x�3�4B���Ģ�D�Ĕ\06202�50�52P0��22�25�&�e�i�픘�R���K����61�=... R��      �   9   x�3�4���K��K-�LDb%�䂱������������������%V1m3#�=... {��      �      x������ � �      �   �  x��W�r�6}��"@Z$���ݴ}h�d'۷�hȱj@�N����,v��v�3x��{�չ�
�i^.��ǇG8؃ʹZ��J�f�\�yP�l��,O5��Ѳ�ʀ��[w?K�������A&+��L�Oo�,��� ��e�E�υ�|5A���mmb4:-kK�|HH��0�����$�	�|��.��op��V�U9{L�%��K�K�Ui�9���RO�.o���$&I��a���Q?��������R�N3�!�<��4Ƥ��j�Y�NVܔ2�sś~o��ǠV� ����Jdzx�{����A��=�&_`��»k�\�V���dqNkvQ-Bo�]-�04)���Qɦ��imL YBm���U��[݄8���P��hg�	�q���.1��8�؇��q�u-E��4k�1���JT��??}]�	�_��$���`����J7�M�X#p��1�$��0D�����6�67@�[��`m�"΍J�Ů82K����+�O�j�����}�x$�;������3�[�FT9��)<=����[Y��bK�� t� 3抃���8C-A0Y>��6}3_�����?���u�
���ܮ�ng[Q�i�k(���V�Sk�:�N�nihj@��Cx�s��Y�s�#���b@��xG׮nh�%I��a�M��On��l��-��h삃�ć!wi|�ߘ���\�vpYlͥQ��-R��⹚���a44�C�~�CH�+##.���D���;.� �0	�z��^�ȲmW���\�-VSx�`��a���t��6i���a��Nd�,;�Y*�Ӹ%�o� ��� ��cg"�)�?�K��lqv�C�^8�@
f:�a�DS����S
N��>�,{lgt3�a�FcYvjx���T9�������Ң���_�� �v�@�+��D��3�Z�Jװm�a�,�m<'��v��VM�s�v����H2��t[!��k�h�Ւ��޵��z�E�aO���Z	��F����L�Åmw[�k�cwm�b�0���'\�����h<ǅ,
�b�6��Z\���o	g��T?�{�;�ܸL��,�mK�?j�
�Z��a����j^��4�-�xw8�i����h߳$P�5�`-k���!����      �   i   x�3�4B�ԜĂD�Ĕ̼t�Ĕ\06202�50�52P0��26�24�&�e6#$1/�4/]!�(3?�&V���ĸL8��f$�����mjed�M�+F��� ��-#      �   �   x���=�0������� ����Ǡ&.6�������P�C�����.UE��=�]/͢m�ܬ�D�1&1i��8e�c�-L�u�Uv����� �Dgj�Z���1&c��*;?�{�eY~>g�ٷ�yjV�ޥ,����<�o\�K���k9��V&P2��
(X�k�Q����bԂ�>ѣKc��r�S�M �Hu�      �   t  x��Xko�6�L�
�ܙO��yy�X{M2`C�@��V�-��.�~��$S�H��8�<��s��Cޜ��t�(���^�?��)C�0��D������1�Oũ)ʯ�����0G��<��6?7eS�����<+��w��QJ#'Ʊ@O���*Đ��8%�{k��m��y��E�q^ M,f�!4�1��r�VY��7 *p	��Ș"��	(Oy�J�Ā+AO�]��S:����8�1���}��z
�5�S�/�o@M���(%,�܍a����rW���D��pe'�A�ssj�r�|,�W�6w�?������&{;�e㦖>jLn��,���yOY�M^f�����/}!�tcXd�����/ ��D~�a!��p�
J��)����I5g��Y�ß��Ԩ�e�T41z����`�ݞ���[[D@���S��)zf�N��4L�pcX$����M^�T�AK���A�#��0T����YST�O� Ѹ��]��wh�?A�#L��Ű�mV^W۳�);7/���MD2���K�����]g�o�VY�s���v����OX�]N��fz���e���D�4 ��Io3v�UVf_���af"x���O�ai�u�D��吙f�3�I������o�@uQ8���|���p������x@�2;}b0c�`�t�_M��y��d��h��(e��\��XA��l7��ϱ�T��E �2��QF=V����J�_T� �i/�!�+jbٕ�gU�ڮ��A/�T��-��^汕�%����H���
�s(J�X^ۅ�BA�����mc�����ù�.=�
�B�K1p�]�a����:P?�R��av���5�G����h�M��1�e���)��7~�=���N�p>���`8�}f�y�=�:��#�g^	��Yٝ(LR�r��|�/a� �.���8���`��1������ؙ1M��B����P0�ㄉ��Tg��cu�G�&3�N&/�1���./����KVԣ6����ZbԉQ�x���R]��բĮ�-[�n�_�=5*O�[�k�ҫ�¼Q{�`8�o���5�Z�G��/u�չ��CR��S������e��Z	��3�s2�0�/���F��f �I|�5�.&���1�[U����.��boA��kC�:���ԍa��f�������O?��q_�Ã?�94Y���=6����M213���Ʃ�bl�%I�@ipw�'�����`��v�tR�^J0$c��b���j�'c4����Ű��W�Su%�~�H1S����$��De�����.���)"k	�1�#�>W��y���:�p�Iu��pu} T�7%�%�|])��0�#��6�6��/0:����C߻�6t��%tb0/����K�z�#m�g���+Z�����>�*O/-�	����!��>��SR��i?*`N�SR�`t\r�+��A��o��oh��d��z�#7Jsc��iU��f�߱đ��0E�-N���g�P��ZRu;;0������A
ݠ���W��#_�d�]��uOn�10.Q���̯M��t3N��)t��ȺC[����
*j��J��P{Q2¨�W�1�/�_�c�3kO.�u��/�b�����      �      x������ � �      �     x���1n�0Ek�s�YH")�>K� �n��#��`�I�c� Q���ַc��������6ڳ�s�6�>�f����&�@b"�߈�"�`���+��(BB�Q��+gob���5Ȑ��C���RttƐ����%��HK�1��������5Ϋ���]���tB�f�!O2�i@�<]�!O;-�D:�ty�jК��8�kW����9������׻w7�W� �(�êkëk#j@�Y]�+�c��@� ����:�HF�2�
f��$*X1Ȭd� ������p� �*]1H�x� Ā�cZ�l�i n�&cZXKK"a�j����fbP���U�_��
�iW9�	��P� *��o�����X��kNk�A8���J!yڂ����L��C�w؀:'m0���V�:�Hca�D{g�؀�3el@�3|vhl���K<elБ�؀��G�N!�uр ��A��E��4`�,ɺ��K�-(��T e��XM>�������      �   [  x���K��H��՟�Rr%t��v�P`���Lf�"!gp+�F��U��V�8�K�0����Q��pxL+xk��%���9��!���n���*��q9&���r�t<��tO|T��*��34p���+��>�0_�Cϖl��" !}��-C��	��B[� ,v��^^g��a���J�]Vf�"E���ex��JKY	Ō��RJ���\�R��2�`q8Y^�Ӽ�������ZN)��v9��ș1��8���*�=H���#���Ċ�ev-rhj����~�Bc�*fF�1^g6a� �.�a�#�ȢdF���ǢN���l0�Du�(�1��=�ڶ�a+�Ul1����P���8���nw�M��n��G3�0�˪�#@}(,�LG�T�e�N��k����ΒoO��*TTΑJ�j���o�7_,��u'�|2�E�CX�ٿ����c�KlRF7��	���wY�*�˟0�l��zq�[g�d�(FbK�ϟ���/�yՉ\x��MZS0�kz����#}��eN�M�u� �!$:)��`Y4S疋v�Eo������F�v�Z�m��9���UQ3�jd� P�B����Y�5��*��=�������3�)o?x���ѹ[ZJx{��bO#��]:V�3���W��-	�����ˤ���H���D"i ��n�� m�'Ë���R�ȋ ɼ�Z�F^��n��"_8����N˳~���o��TO(��fi+h�bźŐ����@�(Iw�.�i.t�Gg���װ�ِE���}���nk��Q���{Չн����]�^v��������������	=��$%B�����}���>�a���`�h      �     x����N�0�ϻO��_�ķ�P�{���*�*"q�`�=NP.>|������3K������p�m��@0�r&sVd����	�Q@�
�?@{�eq>ʕ6\%X��M.�G�����-�\�Ө ����͒Gi��$3����@���>�w~G�j��*S�C�M�E���2Ű�5��ː5���'X7�>W/tfX�e�;\��c�2^���)�4�c�'��*df�\~�mj��E=ky,O$X�O7��u蝼            x������ � �      �   �	  x���mo�8�_+�"�rI=��n�E�M�C�zX@�EJVhb�,)�ާ?R��8�E_�u��o��!9����{w/_�M����wW���S���s���6�<��\~z�߹��_\0v���W/R����:��N��S�R����ޛ���{��ۇO�_���ׅ��0�A�3R�Dύ�]��O巻}����vd>�����H���{��KϹ�x����4/�xW���l$/�2E��1�ifH1�~��ˇ+ڬ�F礦�����f�@�ibL'GE�΁�1�?A/w��ڶr7L�|��o@�jJ$��s�g"�X@j�fzr��p��� �)�����ۺ��7�hE@X`+�ݫg���T��{�a����*�Y�I�p꽻��Q���/e�>|ߕ�Ӟ^�'%�T{g3����o5������g!�7S���S�a�&�r�KI��\x�a����͒L��d2|M�m���`9��'5N)G\��2�T��_��g'5{2����n7��-��$N`-��T������`S�w@+'(g�g�oCQ4l��� �l,vk�6N� "5����y���x7Q�S(���4/_�6|���������%��!�R���|_n�ޛg������a|���L�#5����k״�k�?�བྷ��`��x$_A@j@	-�ON�xdvR�c�SS:�X�����tդ��}Ӈ�Y*a@�32�A&����f�#�s�x�`�����ʝ.C����E#�p狘Ԁ/�Ɗ��Ȏvd�e��������Zm������8��.��E����7|���QW=wfALj��H��q�ڭ�F��I�1I�VQ*���k@M��oѻ�*&g��I�	��!�ɿU�q�n��a�����`2�V�������{��<�؅Q�$��(uO��Ǧ<v�7N��TyR�"S'W���ک��u~��L��ź�Y�G|��)	���9uҀ�S�o����l�������g��P��$�a����ʑ �e��-��i�qq Dp�e��4�X��P�45����! ih���4Y�����Vc����5F�,��5��[ՂǤhN��?��ƍ-R�����11N����F��3,��4�i�����]����mbq�2f<ma����d&�[����'5(;�d�~6�E��g���lF�	Aj`����mQ���F̽��R(3:'3�eX3�F��Wo��:N$��\a��f�̏�2lj�0�6P�8Npj�5 ��z�Gj����Ԙw��o�� ����Z4'�CI�&��+6m鱳(u�#7e�&c�Oj�TK��R��_����i(*���*�CȫMM�tr������[����0YT�����A���7���7�XH<h}��	ր��E��%�3+��-j|Z��7//'����E�$Ζ���0��|��}�i�ƨ\���M���������i^_�U��� l���̂����)�����z5��s��"���F	ofD�h���Be�8Z0
I3�?�H��#?/ڗ��E|�`G@,F`.Fr�bH�.����B��1�	{T�R�`����}�([:g[Bh"05��w�ʒ�K|Aj`�)QT����!#{I��3Aj`�X����(	�D>W�TB��bj`���z����_�0� �+������s75�����lj��#��-�h't�,�9lS|l�o��*�p%o6��e[m�o6M������2Xk69����Ԁ�.����9JNT�Gz�.Q��&��Y7 �Z�cR,[¢�p�@�55 �%0�o p���`���f�\�����dG�b�v>Q9ȥ�OƠ���*�fnf�̜!v��MQx�4c�%�}�	�3���������8���]}�MU�|�15� :�4�}�Xu�����i,��5�����GX �b6���b~�/&3�����,4�=�[C��m)�Z|��'2gQW�����XCF�>zA��t���`���Ç8�58г� }���+��jj���Sn�T�_�ަExj�7�\gN��r;���p8��l���o����3���8̔2���ySC���F�ʅ��i���T�y�s�Ƥ\�,��Z�/��w��f��������`��E^l��h�T3
�ԐM���'�hJH��_�8��ۛ���-�D��%9��~(6Z5�!�j�t��-��X�&?֨�b �z���V���>�J�B���n5&m~4h��f�����XqP�rM�{����C�������;���:��/p�C��2�p����A�.�b掇�d�Uʋ�d:6�@��Í ?��{Pt��n
1J��m�r�[-����l� c������V�9?�Uډiu��L�^e'��pb�����V>?�.�W��;�`u�����3�b�ݲn�n]�N�Z��5���G�?;;�Kw�z      �     x���ъ�0���S� �D�5w�.�2��B��� �v���R��7�u���a
m�|��s���Х�'o�����$�*���Z��|���v�C'O��x�����e���9�4�1�rA�ޏR���W�J6:/���,��ˢ�Eq9���b�O�����J�����P`1T��l��[��#�'��ʊ�ΔO3��˰9�}L8�< ��BS���T>�l\X�Qh��.�v�� ��*���e1(�!f=dyw,u�6yg���2�z��v���U2�e��Ѕ�)�	'�P4��y=X��֞����_�K����di(�����G0���L}�4�1�����v\�e1`��o8�ħL[BHC	Ъ4W�������r�2��Yk12�Ky��IkhBnʳh/�}�̷٪�_�O�Uݽ����DC�܉ ՟� v��9P;?A�1�4D(����=��pTkC"������N<6��]�)�4D��⸒u]�J6S�� ?y�Sl�#F!������HC�!����       �   k  x��U�n� ]�W��`;vQ�VU�i5�.:ɲl�Z���qF����G�@�"�����	Н����*K4J�A���TUQ:xI��^��)+�%�.�:{:�E$�L��"���o����Զ�0�$���#��n\���C�,k�)�od�k�TTIu���l�o1�,�sK�:�NG9�e�]�B����O\�`E�?jyzC��ą~���+�S�C`?��B�&�I��G�'*��z��J�*Y�(�ϊ�����{l۞Ϸ������+А���)袤Q�&`s�!�8�6a�`��!��k+���Z���cިSF�������}�6�ᒬĜ{sI�Û� ��g����d�E�$���Q!=���q o6�J��%��'�A��0%V�S�(�Xg���@�,��,���,���r�<]��Kߝ�u�>lku���My����8=0%�s�C��0�G��(�~9���Q��Lxϣ2�0�����~kNp��0�'t���)���6�P�ϸH�6P?N��R`��I9ݺ0L(Ժ�2귎u]����k�����ԇ���{Z�3���ՒP{m}csa�v�՗�Y��n��(w���e���i�7p#�������`�U[      �   �  x����N�0����49��O��$l��v��	�a�X�������4'��|?'�?�a�ȋ���j7�ޅ�v���˳�������w����Q���$	����42g5{:��J�����y�=����o[�ܐu�m�k���j�~��ju����u��v��}�Fғ�ޙ�i�����C��cy���wdd\�Z���=b�J�������ְ�q:N�>����x`J�"I�'ߣ/e�$��3�g �Z���	�p*�*�
@�Z\a)]����� cjq�K�p	נ3�3����{���̙�	�`3n3n���u�$���z]ֻ�w ]W���n�NIw��]��t:��'� N��u�u��Q����L����@�^%|�Rd	�κU�*e�����Q؏�ΕMc��wåL�7B�?`�M      �   P   x�3�4�4�t��T�J�N,*I�LL�c##]]#CK+#+cslb\F`����Kp`jel�M�+F��� .Q;      �   g   x�3����/��/JI-����w	�4�4�t��FF����F
��V��VƦ�ĸ�8}�9s��K�KK2��8C�����2���������W� ��#�      �   �  x��\ms�6�,���o�d�zGO��j��I��tF_ �`�� �ȝ�﷠$ǥiUv�V�@� r�].�< a�A%�JiEdjA����es��$�<�G2�T�Q\L�?h��������_ڤ�&~�L浖��N�(arr�ѽ0{c��-�hC�V���2����b�PX�+���<�r~S�&#ѿ�d4���,��������vAS�,P�iRM��i���[e,U�T-�IB�X��+�)�������	4W�L����Q?�Z&<���+ol�'S�	�	�0�pN�3H�;�tcRa��hʓ�k���oV�i4�(����'��g�ذ������:	c/���4<8e,�6P.�yn���ͪ����:�G�Q��W��>��֜��Ȇ�`�?�*����3%�#�1�ꮓ��ce)��>j2}G<H����w�o�ap��D1}_�5.ge�t�����ؾ���b��1L�0/Ʒj��>
�;�.��c*�bQ�R_��Fp�a*��ޝ2!�LF�]g)-�<UTD\G��TL��O<��8<QB����$#�e�b8c%���v��������*���%L�+&3�����6���l2E��
)k�i��1d�;7����T�f��GT�x�+:�z}��Ä�Ώ���LpS4�����G����,�\����卜�ܰ��#[,�u�I�"ͰL�u�;�w��(�Q�3����e2�����Jy-��wnIGo+ÓC89;�����?�y�������N�~����[Y�U���k�+.gU��Ψ2�
ǯ���@�R0����O���ֺ�n���t{XT���C@�y}��\�
?���ƶ�3'��WWW�1c�y][+�>8�:oW[��o<v:�z����;F>���b^��I�<.�K�LY[a��7k��@Ь������M��w�����9֑����S�@�U��7R�s���5h�Γ�Y�.�������e��E���5�Оs[�/�p�Ԕj3�m���o�o�=U�m8@*t,"��Z���p5��T@&fB^�e X�H9
�$l�Gg�h�ґ�)����j��*�z=g� ��rV�Ɉ��,2�_�d�N����W1k�c[58	�	/=Y敀�nE��r+������W&�ڏ�S)��J#��	m?FO���� ����b��6#��i�f�L�5�h�#�sD����@��ġf��<5���4[��)�y��<��!��U|��	K���1>v�$��]�����V�Ǎ6�R&��'��!��a��e�\��ܒ�[�pKnI�-i<�%�&��e2/3����|���c=�r9�ܪ�[yN+ �O��b.�M���ᇉw�s�s��~!i s�lz.ܰy�r �k��a�`���
�m����<z�ԁ|7�?��8BY�G�4Ze2/ش���#���Pv!��%R�.���t��#����_�Xɼ�QF�b�vu:�|:��_���2/x��UG��Y~������AZůo�2/����rB�o�c��-K�n�XrWX�I�ſ��2/ش%tôQ�%�~�ϓ^1-SV���|g�˽����z�y=ͯ^G��i���j��_�����~���y-�j�T�&fl��{:��? G�;Q:�������N��a@���d^�����,^���^�{�Γ~����t7KG��[:j���1��CZ]��dި�y��Hc�N      �   �   x�uO�
�@=�_���$S��R\�^/��"�)���כ��M^^H �ò�qX:pb��,|�&M�Ed�	 /�V� ��V�up�W޻}8Ug�hqYڻ��x2-��IZ=�4����#ɼ�`kT�p��6l�?W�/����5��O��Y'��E#�)�ш/oh ��7����M6/o�~�RNR6�z�6���5BM      �     x��Umo�8���
���'�v^h�޶�%-�dŀ��b[6li�����tMsi�X�ɇI�곛ٔ	�;��������_�������<��]�����g�u,˂}c�K��'B<	��)��:SV��#A㜋^{�I{��)ôh�����-�Hx����L�	Yck�d�)��>�g�0�z�7�΀a�A�Y���ѐ�3�j��h�E d�I,^�2�|$��h�+��S2�.0��"��Vu�l����r~�:���U�a�ptT����(|/�'�'���'Rx��gV��Fl���s5��Ӈ��ˇ�~8�����|�(��V�"��+4L� v�nD����m��u�uᲴ�����p���5\�]��,\�*��"
gWe�
�T�+ S�IY[������ uE��� mR�7T�^*KX���kH�kW�ǝ��V�Q֧3�CGVy?�2L54M�����`�΀�9GӅ�ҋ�F��2�h)���蔖�ΈI��WX,tNG�2WT.'�-��ܪ,13[g��΄�X�a0���5z���LҒ,(91��.�4l�
����H��D�\e�.�μ���W�'�-Z`��r�u\}MV%�j���+�4�sH}HT�;�t^ų�U��azO�R�F*�.s>�1�Zfĳ@��?)QT��u��5J�yB��M�}c���"�Hp��̖ܺE���Wn)Y㜶��J]c��]�
U�\g~��y�1���9�ٹ2�.�_���k�Ɵ���uYR�:=��]G�"�£��a4��0~O����1�҇�>6�c����rF�ώa��7&��,B�Ĉf���C�w2��sJ��8Mk�{�o�*c?E_��x���g��s���-�D_���tvs�5����\&������Oۘ'b@'�^�n
.n������h�a(���p?Uaw ��
K�;���N��G�7�~�p��?�{.��ݻhv�����#AFI,O�~�����d<o(��O�����3]�|dE���,~�'�|��/|���#�xtRv��!�t:���s      �   u   x�u�I
�@��+��	j-�Xo�Ő�O�?xIb<�nEzh�̄8�^�"^�AZ�h���k�e��Y�8��F��glMի���-fdM�����_�̹6��T�
~?�y��;8      �      x���ْ�Ȗ�{]���d�Ҭ/@�������<���ٵwd���ϱ��J����X��/ǝ��x,s����i�LP߈o4�!�A�A�� �;B}Ǡ? ����׿ ����?�(��)BQZ��n]_��􃘰��������w?�o�F�$�x$��������?���n�X�'4�㼸.߶O�k;$uZ),]�����i\���>�P�:�K�.��c�Jr9� ��b�T�;- ��O��]���Y��k,�m�.��^[OZ��^H��`�mW�4i���kcu"n��Ԝ���,�4�VVj'��G����z��O�7�P�;D���S�S����e[H/�J�/����K%����`�\����/_M/%�N7�����*��sF\)��&�aF���.�7�c���2�l��Y9M~B�l��_Ó������<8�~�:�Z��P�>f&Ӂ�2�:q��f�kZ?c~��	��IR	�>�B�W��؏����M�OI��c;S��O����O�UC���'��ӝ��f��_����9@r����
$�xi!#yl�.+4-
�wɸk��-�׶¶(�iva�j�o���HӁ���XK+Z3�&�&u�@�8��~�R�du��{.ow��s`GOݡÀB�W~�h�U�ݬ�E��[��XU�lWa;JZ��)��|q����O��.�f�w���oq��k4�3Ϭ�9����(i7�s�!1X瞕y�2j�}���;:^��/ɬZ�wA[l
t��u$��"^�pa�e��(�o��{����|���=�@���=�.g����S�!��+�Z]K$9��0��R;��2p���f_��+�7ڟ4���E~��4�pIw�Ɨ�ͰQ�
I�d��ND0���*�(x�7Z-��ח/M艔cپ=���S'	9U����5�be�ǥ��<q:d���'8w�U�Gj�4�J3� �\�����\!_/~Ti��ph�d+XE��ŀ����:�*�J����OJTm^���W�o�?�S����9_��⣵�*��H^�gUq�)�wn�S��#�k��Ę���"6�s�`��E3)?U(7���|���Ȫ�=*n>E��'��N�v�&�K��$��VOjQ���*�zӷyer]p�y�C����9h�3W&��a<��w��ɼ�/������h'/�7�N���YZ�*�6�P�b�8.E�)'^qш��D\=�2B�٧6a��5���v�!]�0G�5��.Y6��tϙ�f],U�:]��[jJ�:Y
_�T���`��P��qKE{H�eg�N��z�f���a5�����!`Ďp�]cn�t^֦*��O� �k^?c~���~���:��oD}��'��2r�<)�6jH�6<�E𮎦��U�<� �����g�S�M,��(�'L��=b�!>Ix�o1C���5���WS[2U�F����8�TAKEf'������R��$��&���7(*�B�Z��R�%�i
u�Za��BjZ.��4�y�P��~��F;a�I.�����A�`������U�M7�b�Y��O��.&ǋn�60�C�\Ȋ�G7ͅ:��������l'Ic��CW�;�4�тoqGL�"�KUe��*0��:��ҿ�#1qa�)ޙg�k�G���Gu��'m(��k��ps:n��*��-���Ϙ�h'��-���#���{^��9d��d��k	���$�{3%������H�vN��lR!3G�j�B�n�6�I'}��Ek�D��	���$uy��m��w�yנ����ץ����W�� �.��d�%�`�2 �?I�(j�s=���Ů[R>�4� �N����������w/���W�4�Ⓣ�G>mV3|�̬d:3'��e�	�Sj�=P��n]'�=e�r}5���P�C*V��@�u��v�6n�B���E����t�9M}�9cO �T	��6��k��v��|l�yr��&o��v3R�:�j�!S�a�/���Km����s�o����E��v0�z�/,�y�3W�ì�'���A�h�S[nX���E|���f��+1jy$37k��E3�4��N�Aj�D���s4�M3e�J�m�,�1�d҄L��������)g��,=B��=�`��Ӱ1��vtL�[�&k$�z�Hמ&�d����ʯ�?��Ϙ�h'�����v(�~?ޟ�`򸀯`�{W�*�t��~|hԪ����Q���ml�.���|(�r0־�Oi��CvyrN���礥�L��"<�~G������h�������ON`IW�X��~N���_O�i4i�hG]%�z�=�_$�{���-#��8��_����O��(�yx��a�_0qV�����mU�����?������&�e=�v�s:�κH�z�9�I�)���y ��p\��b���7��C���Ay{G霄_�5 o�su�`�*;$д�^8Z��ؼH$*���A����9ݪ�7��d �YCl
�H�#6�
���=��Ѯ4)����3��:�!/�M3[���l���}���v���=�O�������x�>}��'���xwM���5�w�yͿ�ś+"����F��'�h�Ր���ޏ��m�,g\��M��iw�T�r�~�p~R3�ݪ� ,��x?K�n�_�.�0MuvY��G؄%eTe7zi>����(��27�����w�r�Iiu�>J��9��
���I�%�đfZڸ֍p�XU<�����M���SH:�<z-ߏ��b~����^v|���#�OG�>���o�wj�ke��ub6�!� �|����E�`�H�<q@T��$�$�1��bWz�X�lϰ%4/ʈf��[n�U��vV�6ep�R����2���1���#���	ޑIt�d�;�?j�,>H��K�G���Av�@_䷼>��F;y�,;`����oB���-?�x�;��趃|}So�tsҧ���h�sT3���R�hphr���U��HIB'K�,6x^/��X��L*?�	U�����t�A�W:b�J��8�r�GQ��?=1��3:¥�OL�a"7�~��łC��=@%$RwQc3T��"B ��[C��	��Wrޏs�b~���~�=(��RoI}�ҴF�e(3K
)��>�K<S�r���=Md�,���p\/3�0e�+������z:SF"�P�SQg��3�j��l�Ȏ8a��E��pf�{^��C=k�+"xL	��˟��Su!$����Iߖ��H�e�K�(ŵ֨ F}^i���Ĉ�;�:���ٔR�L2]!��c�B��cu�a�'���M��d��c��G�EЕ��������@��K�.M��cj-v"�Nw�)�kW�즶4Y��v9���{1�3�1���kD��%6��[�
|K@�6OI���G�_�ɖP����߿&�3�7�I���+a��F�����-1(]�X.FX�waYT�;�\�Qh�J&I�<��i��9�`���֍���lPRM�Ν���:�̸����e��M�ص��E?���8`����v�� z���#9d���ӟ��N�T�ˢI��x���
�a�F��zEx.�,�5��1��Nb?+���@�7����c���¥u5��W��\&�%V~^5 ��8Q�¤�j�!�2��tyjh dQ:��gǂ�Q�S�VS5��E�x�������4a=]_��=��C,*�+D7v'j�}�&��R����K}	�z����7KpEƠ�6wO����i�e����>��F;y��@`��R�`��j����,K��?�N/Ύ$:���n�ÁT�����:��`�B�L=
�i�T��sB�z��B�`B�14MKX���-}`�}ZD�W��Et+L2x�&OĂ��Vg/�H���y7�"	#C���Fؠ������,uL��5+B� �Z+�U�aZF�9�-��4ʠ�,�[b��0
}�@G�`����/0��;���{G���V4��Y�V6�T_o�9{BM��i��{Uf�u��v��Z��.!�Y�/��%5Y�\� /��    [Q�k��WK�"ct�,����#6�{�"Հ�hn����
��s��OX-ºH�Ǩ9HX�p��S��Z���Å�1��NX?L���`B���z�%D�!��C=�P��E����ʹh�<��j�
zjYO��+/5��Uh�
�Q�/0pF�FDN�
sX|@,J�����荮6^(��dsO1  3�M����T6Ni�N�fp\h�G��	�2Xx��'�������N$�{$��'��H�&�=���[��������<��G�Kw���9�3�s ��sl0�&�����X7�Vo�p�˄�p�u�n���<¡������ڸ+0Y�Xw�3\{�z��@z�����J�8|I[�d:\cƸ� 	��$?�{��H��]
�~ԕ�w�=��^��W?4����~d��k���> $<�9��1�ZB�҂���v�*��:D@v�<�e,xP+�<�,�����pmRc�֛��\��^�m0�2m�M���=����wwj�	Q1g;���X�k�����
^��`�U��WRn���X=N�]������wR�*���oϾ���vi���q�
 �]���e*7w����M]�))��de�ыт�t33d�m�֝�Gv1�i3,r��B4��4�T�5^�d/���9[� d�|����ɀʭ���%_�Y���B�^,��~!�k�E_�,��5�m�*���HKp5~�g�o���<Q�O�	�����-����F~,�c�1U4A�7�����z]|S��`�-nr}<��%���8�t�h+כŇ	;G�tf���E��:'��H�t�T�����=���qi�d��+���΁tz��~��IU��zY;QفXJc���R�W���ݐ��f��X�E�<�����)�Ob�o��l�>Ǣ�R�S�*�PY�.K�Jj��َ0�\
�E��Ć��G�P3�i���2�u�c�Ü�CH;�\
�d���h���g����2��^�8Z}����=y��[���ۚ� ��5d��ӌs'�p��]��:h&�\^���,F��+b��F;���'�~G�Oy�6~�n��}w��/v�*f$c%�	�"^�t�{82�ĬgQ*:*�g������7�D��iY�&Y�v=�`a�|�C,�T�6i�p���6ࢿ�6ozQ��\�3WQ'U6��=c�]�ʛ���у�v=@��X�r,Üf6)��Q����5�c~��Ĩ�C���g����_�ɩq:��^�Q����G�Y]��J��V�t�0t%�Z�3��'a 8���3�c�+_����_O�6fR37yL`�ewu���.��]^3�Hk�^� �tHv3�ܞX������5�4��R���U��z��seN���Ϙ�h'1��B���l�ʐ��%d���|��`�gM�+��v<���h^Bq7 ��=(E��"�+��M�j�W^V��7��P`�ͅ�
����[̀T���=�� bs`1j���Ff2�^�Vy&eM�/��3 \mX.�����.٣�j��D�Zp���H��i��{b�W�Kg��^�))�V\��9�v��%H>;糸�����]�s�^b(��9x�#�JY�zl�d�/7�8��w�N�9�$9�A!�+�$�Yb@�i��G�����֙B)!�����> ln9,��Ϛu�D7��$Z�jQ�xӿ��S�b�g'�I;��\Ԇ�R%��������ĩ��E΅g_!��z&NA��.�ŔQ9I�2<Av�)���g(�9�J%hU��]�m�d�]��e_m]F��a]b!%��R���"������7�0k�d��`(h!��}Ifg�y��{��Q��� ��Ի�b��+��rj��A-A�ͭ�Пc~��Đ�1��R3r���B/T\� �mT��S�=�K�Wӹ%� �_��#X_>�J�P͐�
QU�z����N����<�����7�K�w)H���ȧ�q������)JVbW���L�mZr�˫ �4ĬX{�	s�	�WV:6B��d����İ����I�M��>�����G�X�sq��0=�M��)��W|b֦�2]��F��v�Ih�̵(���~S�4� š�JI ��b6���.�vi��MWS�u�l��8H� �L����_����.��Z�r�/bj`��)5�W�|N��1�ai�h�J���]�c����W_�+�7�I�w�ly�}��%�U�&�Qok�e�C�E6�0��.�JwBȨ?C�����2�&0,mb��� %�LYDy\C�ҥ!�E�+�(.3:EXW17k�d����U��4�Ҏ�ħM�C��� �Z^�]M1�Z�������j�i�%7���E���}��9�7�I�u������1C�ｅF����	>D�c��v�֌o�S����$���+��1�N7VƏg����܃�k�U�W����,k���z5�� �ĭ�"��`vX+K^ 잲.`�Y�G#^�w���U �i��,�,���)�6��r�5���Ё�"gi�Rwed�/P����ק��h'/�W^�K;�;~���"����%��M�{��7'=�� $kuF�2� 8b�4��DnD SdRv�=��@9�%�+��yg*��B0����yu�ިFkO�M���Û�bT>�B/[p������Ҳݰ$G(Aʺ	�ùg��Bj5?�,��h9z��I���ǁ������h'��/3���8������@f[�2?�t���1�e֓ʖ���á�bj�G�4�0��嶋b��̴���%���+[�
 �(�y��Y~k&�ܫbh^�����Z�V�Ij�ZE�c]���'$�*p�K��}�WT,٭!�ĉ�2��s,-��g����?��F;yѿ�"��퐏���v�vT��E�g)F� tG-��2���A��!�_�:ꍝn��!����ј���9=b��*��sq.Y���I_���l�=���ʇ\t�#^���h?�&�($呹sb�	w���ņy�Mˤi��J*���ph�a�^��s���^����v�"��U�?fS��v�X����0�G�W�`Ů���=�U�K�+M9���7ˁ!�̼)�=��.�yP[d4~��=ͮ�z=��;��,�g«��]O���wAN�2���%
�A��TW�b4ʁ*��� 9��_I!�V���yN\c���,$�V闻S�t_e�?��'�C�D��-���8V
�WǳD���+�%Z�i�9�eAB�K�����,�9nwĄ,4x�a��^ ��3�/������o�딘�����f�IJ�}�����
����@勦b�G��Ѝ��KiNI��j�o���{�����F��Е�u��-�c~�������h��_�	
���V���<�򆢾��rOY<�,Z��!�����>䐪/{�ßc�u'�{�xv��mƑmZ@>V�>rV6�r�
�,d랠-^8z�^����þB��s<��һ�=\�ne����R�G_}�U�A�|օ�p�G�O1������s�u�0�S�7�����XXC�8�v���O�����4̿���q���\�l����?��"ah�S�̴0T�ڶ�T,e�ݙAr]�)�4���Z~1����^�^�$S@����L��iQ�p�����g����j}+#�:��f�2�>aP�j�v�1	�Bz=|�9^+u��.�vJ=J�ۢG�����Wwꯘ�h'2��"�ǃ�ϋ*�����b�ًh�""�
19�X���������J��d?�~?�pn^��aH��c���&R��Z.�i\֢/�E���9D�&\]�-�ja���1��r�ỮU0D��hz��̙4��e��U�҉�R۲U���S`F�G�=[z;�:���g�~������c���8�q~�?����!'�kvg r.zk�V�4����o������d5�AY���a��2RbeK�5����m�������(Cm�����%�8lKG$r(�DM��ֻs!%Uknw�yp�!<9�~�y�J ^.���7!�,�L����pOw)H�    ;6[�s��1x��S�o��ˣs���]��؍����~h�@�t���]I �r���8u��8=�Hr޹�ɚ���E���&�Ys�<8H�L�
J��9,��a�'_����=��z�AMz���$��P�g82Z�����a���#��#@*�HSGR�g֌�U��٘y칃��k˼��!@�w�n�]"����)���,;�Y��|�ȏ��KQ�C;M����8�J�D�0�$x�J�f���<n��Z.�ߙ����C���9�l�V&L"kW�-��%�a�	�^wF�	p���cxU����)�j�
-�\jߋ�;�m?�
'�Ez{�yW�@ER�]�#�;�=ʺ�h�D��~Lc�|n��x�I���o��s�'�_
�3ň��C�/����sg0����4��eC�ƻMptԌ�*8�]�GQGf�L�.{˝X�m��^�AY�~�(�T�Z�OC)q���{�ح�i�W�Vvz�0m*+�9���p3;،�G$�e�o�֦�Ë�^u���3x�NG�jѢ��N�5֫����>�>��F;y����di����{���l�=AMS����1R,We�ϊ�Y�E�R�b	6sHI�&{䑵m�r�=K��G�!��
�[1��BB��S'��er飧O��hj�]��t��V�&1%�q��H�j����x���^��n�"!����#0[-�� W�׷�>��F�&���:k��%�Ό�"g�s��aI�&�n��s+��	�*�9x��4�V������[�X����l�{�,E�*��k��L/�z��V��M4���ާl',9�!7�GJ�O-0�&������%�Kɽ�p9�0�E|�nޱ���~��������?s����;�x,�t�襨�`��@`Zqa�ػ�Ѩ2'�li����p�ώ:�%G�O�ݢ|t��}��̉����q��8��E~���k2C0�:'̸��ģ��ͭ�t�s
���H��_�.��Elا�Q �¼����z����W��Ӳ�c~���~����ȅ~;���>U��Ml���s��/�>6?��z�,�̺�V��_d�1�Q^M��L� �WWH;�Ԫ��=��w�:��&��e��l��{a`߻I��s8�5D-�g��z0��9>݃ˈ�~>�0C�ݿ)	�ݼ��;~�:���qUY�0�\�&��f��*�F�������ۘO^�ox���}D����35?{���M"����>3O,�f�ҪU����p�����&�䖾��]��7{N>�O\��9ұ0�T��v���+�d�i�>�k��!fG|'��
�]���	;�f�D�,�SW����#+�^�]��k�rO��ijc�~�el���/_��2���u^��v��C��1��]��*����*�~�"
"���4��e#}`yg5i��ڂUI��d�g�l�~�oT�	�'>n!�Dw��? �+!�6D-kJ�i� u�ꦀ�.�s������=�j�Ę?��Ѳ,�,)@t���fmˠd��|������b~�����/�;����_}성���v��	�����v�ή��e��2A?[ǀԡ)tR&s�z�a�_4�9�!)ЌF�J�$�B+!�	�G����/����O6tWQ%\5����V����-9vz�*�ta}c @�b��i!z��V'���-��}3�[���8��li�<s�m�'��������a�Wﻑ�m�G��0��(�<_W�i���Ī��{����c*}�Ǜk\�����d8�7�#z�9z5��W®<Պ�鶈����9a�6BS��/�� `�8��4�^*�a���ō�yxn/�U�"}��(ȀL�N�	�$�)d�^$�&���_��������c������2�Gy�ћѿk�w�,���P5�N˺'�F�i�҃s�]��ޙ=�K��B@2�x!��t1�5 ������(Xr<6�_ ��@\]���h P���ƅDKF�A�\!���&ŝ���W��*�('h<��.稇̼,�J������S�UEyNo��s�'1��Ĉ�̯i���?��,#ƬP��g��𺯚Z�yJ���^���?PHp��pc>����ڷy���`�"&=ˌ!��V�����n�F�M�|ܑWT���ˤ��y�W�?��uj-�G&ގ�s��S�u�ƭdA�/��
�PP�f�)��Kb? ����oc>�џ�v�2�$i�������u~l�uלE˗	���͈d:��W�?��Ahsƹ�2�Bi2,��VW���W��}��9mc�ؽot["�PUi��g��^��3����8�T�)�Z�8�Sb�n���b����!f[8�������!F��'!2^�kw�+`��F�&�?����?��OC�c6�񚭷�2ƞV6��g�H�i�`��4��x6�n�сVH(��2BO͵��ma�C�	���ݢB�+�,#��@�T��̫��Lu�-�����I�_i:9/���>���dF�8H���"�U��R�b�C��*cr}\�z���Z��^��;�w��1��N`𯫇�/�>�|Gޛ
o��eM�v*����n��x&0!��< ,��:O�Uw�Y㬅���k���;y�G�]�L�����d�� rR`z���Hb��̖G�T����@`��H�+ם345�VDj��D�h98']��Wў�]�g[�9��xT2�v��Sxs*�ט�h'.�򋄿�?s�?���J�z��<�p���
�b )���U&�Ax��-����?��g�SbVtg��f�nl��D<���'�J�y�a��6���I
H�)���_e���� 9�#�/|�<�L������L<�����#��D��(���4�Ӛh��0I�,�"^N��6�>��F;����������q�/���l�>L�tf69�-��40��V���qX*R���~cq�}c��0����=Β�
ɖG�|�#�f���9y������e+0��d�ίR�45�w����+�It�a�o�c7KSC�y8��(�o����E{s����h'��� u�U�a�q���ο��p�Ng��^�.�%�G�7ɚ� �����O�\xAN���ޡB��cPM1�R!%,n�h���X��'{�{� �Q�h\�'|˞��_�"�bc$�i!��t��Z���|��v}zϸ=���T]�:+]�� gjZM�����<���1�����������u�/^�MZ�b4x�Xd�ѹ��B� ր��3��H�0P�o9���s�v�r^5�����:�󕡷il��ҽ�MP}�$!�$7�]�� ��x���t���kn�d^/m1?QU b�35p���e)�=
�&�np<�ĳGbF�
�a2�՟��+`��F;��b��o�/�N��~A!��8����ߘ���\�%]�$k�.p�^`�UQ�+�%������&<''}\u������(hT�"�*<;D8w�Ѯe�FT)�J�	�x��ÿ�k�y�J���2�L{�7����X*V�ɐ=��?1+c��}�!H�j��ݛ'���^|2- ��y��ۘ��0U�T>��y�y��쏅�%;̻Vk�T��\5CTo�jB�a�� �LiG�9����x\��dV���9'����?z��¤�����ڪ[�M4Y��6�n�ۑ��`����Bt]wE,��x�lq�G�(x�ZG[������_�Q�ņ��ױF[p���k�"��o���6���ʚD�!��g<h��_>�~���?v�<g��B���]u`�F�����~������>M&�|!�+1N;������C���������p(癊�D%E|o��{����Tf� ��&OŚ/���	oM�m�ɢ�z�Q`h~j3��\AF�F�B��q,N?�#�~��7;�~�ɋ��2�_��B�}����)�XDľz��p�,�D�d5�K�(���#)�.TA�K��J���X9��Fs�:���D��S�!qӑ%
�<@�3 ����w:Mb�Z.Y���""��%���    �#}�x�s�U���2��M���M��5�:�yjj	��T�ű�FHP�)6'��F.h{}g>��F��d��!�=2�'��Ȟ|̉����ҕ{7%�<�z���TrJ<������+N���� A�h���ӎ��Ů 	h��+�/^���"��0T�$��X����ң���%���`��
�z�"����G;5�v&z�K�V	4>� �0��n����M�\�.�>��F;��m�G�����w����/"�滅G�S8Y�op�]� 
Oش�؝;��z+�v[�"B�&b��oE߷&�l�.T��(���PW�9\�f�E��C�J�ܻ�c_W�&X��ý��nP��?�9ͱ1�T��vY#"���CND�& 2'2���UN��k��'D���1��N^�ox����m��k�����|� ��/z�
"��q�9�.	���(�">���#PP��3@�/�=�B��e'z��� �W������#Q(���N��	/��Y����B�7��%���OV�;��\j;��r3-��:�m�ӳ���~U��� C��h���멟c~���>����6�k��X���ň�o*�Y+���D��[ѭ,�eS^�u�����ߎ6�U
*Q��v�0f�����X_R�*4���F�ix�s ��9�/�����+}AMc @2�k��k���#w���ܷG���Fh�\�쨞��O�R�ې���ꌷ���=O�쯘�h'�����oM��?���� �nX)g�0��AK��ːt(b|:� �� ��q$�e!��!�>��,�g"5TA)�\f��y�t��vw�)M����N~�]�f�pݛ�V�d�~��Co� 5#>��[����h�˘m$d���0Lа�H�T:�����7��5�7ډ��=��<	$n��l$r�ma� �`�u0�\վ�v�LGs2���Eֱ ��G��	|P<��;ah�t����zՇ]y�`����1�n��!Ls������J�n��/L�/�I9�'�&��-Z�^�\uu�5�ؘ���1{a��27P�����_��@v�y�q8���Y}>�`Á`j���	٥噣m<N �˵}LH
k�����P� �(J�i�d�����rƹ�5�މ񃪫>K6g��w��J�8�w�{�D�BC�3��i{v�{̛�+t�4�j���˛���!�K�L=����o,p^��&������ٯ_c~��Ȩ;2��F�`�����͍~�Ҭ�`��5�׫m��)f���]�qArtQvY��Gd�ٳ:}�NӐXne�L`_Zr@�����yѾ�xr�ٸ?�Z%&�!�)+���b�1�l�PS1I�r��!eW&M[��^����uV[��r/�+��uXգ��;��_���F;�ѿK2��ͅ_��o���\>I�W�1So�GK�u�Au#3�4q|h�\���'v3q*f;��0�kh/�$]�xpC���ް�8�S�#�u�g��I��Ջ���]v�vt��T*G�]	V܂%Q��O�2Z��ܰ�T�s���`9`����aRx`�F9��ʍ��k@o`��s�"��b�F���ߣ�X���M������"���3���c(�˙XVuń��(c#B��v6U��f�����H��<���Ǭ���Cw<��r����-���1f�>g}Vu�}X�@9�@S��%�E���jeY�9{�%�q�a�x�V���=���(�3�{RtW��zfv������*�"hU>J 3�pT�p�N~�ۦJ��X�t�n��d �QzB�)�"��g��4�;���P�����1/�~�t#���kK��JN�=G�c\Q:�4��� �iㄠ�GQ��+EsXVDQF�}S�8^*4!��J�iHRȷ*�+�����ڬ,�f�T�Tq����U��.U^$�C�:.֯�wL�Nxńw�W>��	��P������=���aǲ�V����Xё�{��&�0��P�A�������'�[����'�7I��9���?�-��j�?�p���1b؇'G�3���x���% �A|�:Xr6� �s5���a��,�z��W$�u[Q隑�n�GÉծѬ=�i)r���V�����G
f﬜)����
�
�8�a+�φ_���7��є��S�Ǫ���'�	^�������\CO$�R���L���S��Ě
a��Fے�l�{o��O����_�W��ծ]�C���j6�%v��F&�f̅h1�w8tՓ�I��݂�te����|�l	��f�o��`������o#oD�h���\����
>χ���T@��Ш>�����aP�6�ܾ�Q-\��D���a k�*b�VS�����65^�4S�^� $	Ai�ߡ���'�7J�M0M�����R����oD~`��?ʀ��7#���"���e��r�܂�r?sݮ)W	�Q�!UR��I־3߫n�c�ɥe#�2GK�'P3��%�'�����bΠ�	�Eg��z��t�J�w�� ��WAy�ˢ�=0�;۝�1�s��2�&�\�x�Dz�a�`��>)A����B��K�H��2�?p�?���g���)��S�$��C�s�v�;��R�y�Qj�ԠƐ�U��a1���ID�+2�߆'R@|s����:u�vI�z�P�*c�@�V�NM����[���SUg��X�i�枏���4_�SIJ� ��G�:�`e�1�L@ѷ����i�*,g]�}G���^�ou~��sU��K�~jJ������?�������Ժ����cn���G�c��M@vO������8���#R�3��Ʃ�F�.E�*ugE4b[ܵ
�`��Ԗ�&�ӎ�9^���s@��Q��f�����=��C�Qk�\�
�M��I*�eq8��i�� �{���������=��3�wx#(z��4�JJ��*u�/F��,�(��q���F�7�����N|���p�g�j}�&}����3�N��a�v�J3�B��w���cCnn�@����F�7�SAY���e���{mZ�UZ�<�ї:���'e<'�{�g����!��oRҼBxEP��B�����1��4���׺��\�Bۃ������S�?�����=�����'�臇A�?
"Ӓ*��Т�;�+����k�P��!V�o*���7�d�Ū!ا�3�h�v�܋�($E���$OOb����C��d;f��qi�3��R{�{,؏p�ZOw�6�D������O�Ol&.�%�T��E���3�)=h%�E�]�~r��ou~�~�G��~���Y��*?�|���l�h���`�E�N���h���ݜ�Ј�',	_/��D���U'�F�4��y1���E�"U��}��e����1%�ߏU|Ѓ!�)��/*}��
vj��H�p9�.|��]DZ������[ #���.�O�§{Z���������}����}�z�����O�3�҉5����=�I����+NS���Tv���q?RW�v! �U�ն��[_Y4��~��,����M [|��@��GD~]ȧg���sg��%��$�wN~#�0Q���\O]Q]�U���e%���c�8`���s����~�>Ra��[<��GA%?Kt�$b/�!Ҍy3K��n�����X~h�N�kw7l܎v(O��5�[��Qn	׃`�gn�e&��PM�rjޞ�5�X���J�� �im$�lƚHIº��X��4��J���,���9e�A#��F���P���������-i�f�VL�8�2k��s}~�}������=J���|��̤G�����@��0\x���Ɗ:Q�R�Y�5,���"�r�HU��4�~؏�Q#Ϥ��x-c�cT6�=��ݯ^{�V�̤7��]h��멻&e�AԲA	l��^Cs���g��H)������x[v����-����;V�X�>��r���x>1f��gR��r�_V]����%��j�
^5L=��j'��wn~�����4h�/p6�F`K[dӢ�,�b��y4��  :8\Ժ��]�~c�i1�    W�DI%�39j�Us��|���v�u�A���ળ��_�as�nRf;p)�ޞu�Lz��e�.��::Aʻ�z���z�(y���u�D�ƅ}��9t�a�+	�B#"p��k�UnA�K ޹��I��N��_I(��u<}Δ<"�r�"�=� ��mo��Y��I�y:���#�[n ����kh��9[c0_������畞�g-޸w��&�y�1牧'��;����{�)��;:Ɉ�^�Юi)�g�e��o\���>J�>ߚ�<��gH���|R���'�pD�De���2��[	�*����M$4�!1EG����3��/nBK��)�Y�!X���DΕ1S|Ϊ���U��;��q�n
�}�'_N�a�vW��ٮ~���P͠k-����֒���t$Mn��5�?u�D��E��w�kM ������d���� �[E@�F��,�5�ƃ1Gɜ��[�2ɌJ/�=�=�����U�it��E3����~&�0��}O�ջb�J:�}�^��5�U���n0i �ކ>��4n��=�>���}�lcyBb�8���J���*O�T�R��Ͼ��ɮ�������w��q}3�����S-������*�#?����Y�?��yE�`�3\͉����+�#�9�����C�54T6��;_��Iq��V��P�[rq�����J��{aW�:yg#ty)�`P�����Y�è���Xt�lg%5~�,��c����z���q���$��M��F7:u���U0�}=?������/�~礉wl��;2����x����w�t��X$� ,��q�;�����d��Z>@ḣ�|���S=�ھ�i�I"9#Kё1Ü��r/$¨�JPF�'&"�&wwJ@n��Օr-��f;<�B�N5b��E��N��I��~�aoV/R�Y��ͤ9�4�Ģ5%��A�ˎ]�d���f��m��7��~��~0��{�q���3Cb��y�N�H�@���I��|Ho�|!;�����:�:�ӏ�x���m������Z׼ӱT>��C#Y��W�y�
�yzZZ$6�*�6���[[ʒ�2y0�	8פgo�{_���bn?�y��|��b�E��'P[�p���:�ǟ��F����#4D�Co7���Hg+KNC���%�HŘ��Z,��g���.}�s���KF,B"�qE�$�-n?s���|I�GzIJ���V��P����n�K�ќЗ�`�Ҽu���+V�hU���|5Ŕ����N�jS�;+���a0Xr-.I�>�����0�S)��h�c��?�������?���m<���)h�Uq��T��W�*I	lU�t����~��/ ��0"SX�u�0(���@��	:�X��nQ��;�� zg����힍�`��3w��<�rHc<�����r��B�S���f���h��a�~{�"�}Z�������ξ>���~��(��ިb;�y��<�'��4F��� �)���G�d�>�5�V�]k���M"̮��ٽ�8�՜���sѮ&88E��WO�KC���./��k<����=1���U1�c���7�dU����b��Y�����M�\��׬��_� w�%��Ur��P������D?��h����wfv��ǭ#�P�x	rX�u���ԫ�q�$l1��ӰC3I��Hrų;���Xn��Â��\�>��6/U���-��ڻɷat�@ޔ�ͺNs;;���U�N9��6/s�3�
X̻�HǮ6ʸU(�9F�n����!�\�ؒ��jv8�
��:"{�6Ѡ>����
A{�lmB�I*�R���!����G��=Yi���޵&k-8���u��MRC��J�D\�S:�+�g��w�#���|#���
���J��e�4���^ ?�tI23��չ=/"_���xk�y)�����vBf��!�v
�4v�
Wz%������eo\�\Q	���>.����r��d&���~&6ްD>�F�+U�uphTn��IP���kXc��ˇ��ݔ���U*꼧���@�39e��@>������C�+��E2��	�L�Q_�p�`�*Е�S�΁9�.�D|�ۻ�܁����#�F��k��|��?:"{���~����؏ky޾���HlO&9s[�KO���;R��f���e6wo��<�lP�j=�5�.�\��wE|��B%��mv,�ϸ��D�C!�Xv�)���p"�Y�CW�Bt���n���^pqaNp�X���n���;��oK|����z��# 4V�j)�%���>-H��Ο�޼�o�/�G���p�Ǽ�<u	��@�6������{X:o�t�d���?�?���lǃ;���!Lj���mD����k�f��1M���e��j<i{�3��dz��Ku��.tk��w�b��U"Q��
z��BjHș��#�^+b<��ˬ���3�l�x�|@�C�Odo`߅�6�?�Z6A���3�S幩�ċ�����¸��|���`}��O�|�|T�SP��x�1}�����? �ߧ;������r6Yc��n^�q��AJ�	-���'OJs��������хoZ�<0�6��&�A�1I�2�]nc_�kP��jކ��e|�!���'�!�[`�����'Ԑ�w쁞�'��QW�G3$\ǩ��{͉�P���ca�"n�\@A� �&�!��ShPFy�������"ټtk�[jr+�c���FxְbꔩF���;w��x�c�,ƈ�1FP&����wn˂O���<Z9��A)��&�������d?��������P��J�O����D��0�8���/�'��뾍�
Pr=r{n�9�eHBl_v�;'��*��A�:ӌ!�4}-����v8�V�������J���v��zw�}�N���K���|)���`B	��a
��
��v�/�j/,#���1�p����K%�$�r�X�V6���u���?�i���M�1����ӵ��K�
��r�VKNP�:�9��CE��Q�_-_�x�m4�ͷ�o3@�9:!R>�G@�>\BR�ͱiGN���q>�덾 �D�U��I�h/}�_S����j�Y���t�ϰ"��{�#��Tz�0�N!�1���8�T3]�}K�֟��İ��}�@�������9n��|@��\�>"h]�U��϶��މ($�H���auI�@�n��^z?D�^G4B�D���&b���Ӛ^�?���-���QW`����`�+��{�,�
��Sf��U%�6�;Q<�\%���D��(�Ud�χ���c9���(G�����Z���3�/w����y�l��
ӂ����'h}电q�������+���e�Hx�˸�l�WK�7���ӌ��=����!;��u�X���8���l+��֨6@�"�u�5��F��4�2�L;ś�J$� Y�<!<hHR�ҏ�[b?���W���_���h�Q'��
��E�?|U&�M3�K,v)�c���E=s��'�e��,����<��i��1�Ry������Q0�AGd�8�`�Λ��il@������I�c'�V��K�����!k���Olcw�"�Q3�ع��KD���۬cE��ԝ��ˮ_�������8x��1I��M��}T��1=��F�Z�2��ԧ�zו
OU�2���?V#"��T��w�{�W1+βn�lY\�G�}���;�*��^)B���0�:��0��^��G��O����,\�ޡ�U�A~�\8����.�{�FDA��~mi���R%(��Bbz�o-�+������q��Kg�e�����e77�����"^�~����9�����չ�X��1pi�,�H�MU�:��g*�J�;mY�	;�n�aɜӝ��-���3~�wV���~��)�QDwz�tk 
ד�ƾ^�+���U�b�2�T�g�Yt��3���}�}��j�l�o�}�����_'�>���p�x��f�T�����%�?��H=�v�h�j�S�mAɤ�
x��l��B���    .Ęf)�8%����[�;>�l6:Ȁ`��
|�k�4��ҷ�ݽ�z8�`C����GlV���� ���8�;�ީ�#���=�D��?�������O�T��7�7�ռ��E��j2��ӫ�ȉ8;ѕ^���l
4]g���>ǆ7���W�\�ͩUv�������Sk}b�{�!V�)s(qo�;ȲV�o��0'@�x��E,��]�˱��C��<aM���-��G�9p�"}��-y���{�����+���q9����t������b-�@��z5�)|����q:���y�6ǚ�@�RCe�z���{���!�に���,�Xו���7��w�1H��y�)#��E�Cwߓ�vi�+�&�
��d�u�N~����H@�G�� ��4j�;�&^{�l��fz�JH��<F�[�ߣ�E^�s�_��i����������x�曏á�d�@4�WS�8���ј��*T�r�d)��&L�� I�Q�4�<LQ��S�;/�:���� ��س��� �½�rM�Q��}��}�9�l�㠭/Us���̀�]T��.�:׌v��=1�L(s�x �ăj)�ϸ�-2��+�,Q��e{�.��dDZ�|�͔��ob���Я&i�E��)1��-<ʪ�m�ŉe�"J�=�d����=҅�ۥ9ޚQ�����9�ԀD���8��,�i�§ם��t~����π^J��e4��@��)O�Ǖ|��p�/M���Y�
��܋�������&~ ���@;^E�PY�ec,5�w����ٛ�[�F��.��p��w���.�^��&TQ䴨2���Cޓ�a!u|!lum�Iqs���������+q�epE�'��� m_S��b���j�����/�uG���6��"n�v�<U��0��@;sf��ϙ;�zinRM��v���Zqa�u��)G��X�����y�}���;d0��ӗh�*��~�)��>�I�ti+���d��Sms@�6h���h��+z�[�kbw�:0t$b�	�q�W���nf( 1�w��;s+�]�s��h��xU�3&��d����
.D�KW�R��F����ox�t�Oα�q�^����S]3��Z���썌�-����7���a�L9��y�}��i�l���T�i��ۚ�Ӄ��5����8A�F<��ۢ��to
|_󜏴�حE�n53�&�g�QϢ�w���e��=ڳ��P昔b��7-�S؏2�:p�Ќ�t��wJ�{U.o\UG���-����o�}����1:�������K�c6e@�W(�r��,>��ن�o7n���C�VN�S�
���B3_�ˈ��&�2�li��=g�F%,3��>��+�.1
��'
���0������&���p�ʅ��_�؉�n��~�zv�jo������}p��ro �y�wȾ��_�;�Q���ֲ4��FF�+������o�5Y1� `��Wq�0Z��� ���-��w���P	\v�VB�?�w��%���Ȟ|���].�"��
P�7��Z+[��XW˒SCq�2K�4����!����z*`���� �Ӆ��t�u�=}f�����|�q�w����ٛ����,Yh����
O�4��c�=�T��6��M��RM:#{�3�|���/	<;H�b��O�D�C�+h|I�m>��%�A�I�/�sE�k.��ԋX�Vn�sⳕ����1F�wY��j�:�y��.Q�R�{���C�\C��L��/1�wĈ_J-���������d� ���F/!��&�r_�玌;�
�/�P���k��p3a`��ҷֽ���ĉ�<�2Z�s�5�9D�(��Ɲ� ��(�e�R�z}��L�Y*�D�hOG��>���a<Ν��A��s��f��ߧm�m�}�E���J�7�o����`�׾�G�_�L�¢��BnVV��T��S�m���窦�d�$G4wM��F4�9ҫQ����;�F�ԏ�}�OxZ���? ���%ю%6�M8��4�kVp�`�st�����::+�Y��t�%�{�=������.y�=4J���<�b��Ij���ۘ�K��İ�#~9����GU���a����L�]f\�N�Brf���=qӒ��`�/ըӰ�\ǒ��^*�Z!�V�`e�?��H/�6�
�p��ޞC��3-u)��(��j(6�r�̃�B����6�,K��8�=B�h3@�^�	�!�Bs%Jk��LYdQ�+�Nշľ��M�۝��v��������΂���-o*�K����k�w���wJ�2񂄷W�	_=E=F	A����e3��[[8¥��`dw����t���&(_:��70���-]�r6�;}k�=�)
w0fp@T��ɣ �%��D�X��c榃�[���<��?ʯ�����'�}��6��<0����U���D8�=�3^:��2�l5|�<h~+CfߧQyʓ��SB�oڡ@����"��X����GZq��b<C�5�1ڣ�F?C�,NQ�g���{��|-A�B��vB�1�n�q$�Oj����U��2�V��w?��h��<X��B�=�"f�C��֟����������E�����z;�o���Q�3�@Ћ��������,���<��ыl���U��U�A�Pɼ�s�ZE ���-��p����$���4��G
%���i�P�7e��=L���S[j(���Ғ
'��Z�T�����������$�.�o�����ٿ>n]�������r�#h#?��ϐm+c���GP����̼����9�L�����G`���ix/��4��ɥV�k�̽�y�IN���nN�����ec�����r��E[�^(=�T30�;G�je���]�<d��<��70�i:�G��hG�7��c�zj#����'�wЏ������w��ޗ��"�+C�LA�h�������&�dE�xV�ʃ'��} 	����"�ǤU�K8�}�Y*C��Q?(��r2D�G�xZ�	�����0�3F�)��T�����S~�nVT4��%��X-Ƥ�'�5*g�M�"5Hu)+:)M�U4o����e�q������*R5]��94�E�����ѿa�}��?_�{%<៺\��F�+�A������wȴ)�Be���"+�5�m��𝑞�㖌��>�yl�%�Ș��8rW2O�خ��� �X�3�J�Qe���p�6Y���dQ�#��m��:��XvQ�t���1]q�&в�N�`VR��SphPҌ�^���ls�V��-�����4>����߲đ_�@~x췌!��ENX��Ȫ����'�UxJ�(�kvS�H�n�}���åTA{��x^��Y��_)Z����ؐ��a[��LU���^��}�<P]\b�t<���xݍdP�����գ�ܦ�[�8ϣ�"���i��"x"�0�].�f��8އm,�Ƥt�xZ����.���f	��%�ե�@Ԓ[L,[�]��W�F,�rϒ��xO���z3�,�FD�8��lr��c{vS琉W ފ���c뜃�$`��t/����a�U�N\��M��]��p+�U�Q�ɁGV@=�g�I�o7L��p�J��<��.����օ�n�A��7����ҫ%��c���߰$~���7K�曽ߏ���N8��4TynY�BԘO��B����dTR�waS��l�Į���ݟ���+,�˞��(����4=:|̯�%���.�{�6��e� U��Sw�bǅU�n��I��o!Py7�0(7B�*R����̒�n�����sI�s�"-�(����C}�dk�����t�����)Sj��g�Vd�SC��|�蔜
��)�;STL9`�W�u��Шw�z���ٓ:o�ƙ�ap�%�x[j�6�2N����Æ�ܼ�.��*A�������z]ԋe��@]C�*b§�yZJ-�������搯U�JL�'�_��Z"{�gd���{H��6O��S����k�Rx��w���^��I���
5~��    L��Y'�"���- �������}���w�� �ɵ���?���c����݅�ś����D:CF����,�t)	�vE��xX{�L>���M�i^#�pg8�ٟZ"{#�>���>�/{����(N��J}���3�W�ԧ�D���9˸B=��Zy��&�-�ARUo/AC��N�3F�Ơ�ta��1h 0	o�Ù����~|�c�w\Ch�U��+�G|�d7�<�����K̞7��r!M6�0��},^``-�������-[Ț��Ⱦ��M������}Q��-p�7��ő��=V'܁�`NQ̌��w�[( �M�0�5��n�f8�*"����H�5�X�W�n.!������V�e���29�Jn��\L�LeL�(�X���rP������
M�]������M��=�{X�pW��,��؟Z"{�+���	ߟ��8_��7��
x��z�1-sQ���в<Y]��^�I9���zz���:��Dl6�{���JS�1Ԣ^��#�p��[��)A2J��S�G��Q��ۍ9�н�+����*�@�ً;[�pr4�E]�L��&�/�䌊D��8����M�!��`�4���}O�iP�Uҟ>�'���'�7M����暟��q�
��ކR�zN�Ԣ��1pf��a��B�d���`T��=}0�o���N��O����eu�;p��d�2P�0���BL�P	�3"�y���V% �LeҖ�}~!LDk*��5�g����~�Ƽ��$����5�B�4k}ZY��B�%v\����:XI��a��x���B@����>�G���"s�k}���\$)3��:Μ�F��f&�"�4�w�E�#E��N9mxgԍ��.� �9�4 ��~d"�C�!���m"�O�
s<�;i�09�E�}�Su��4����|u�����1�j4eEä-[:��ڐX������5D<��  �֐�@�C��Odo��yÕ���1����;����@�d/-��KEb����%Uz]�3	�ޟz�Z7&Z0 �4~&܃R1n��B��$������a�ۂsL��ȇ5��KK��RU��$�Z�]ˆ,�
�jR�ޖ|ؗ�(;��,�Ty�e�;�ͥNＤ�_�.�O|��s������o���QE���/�e��:���(_N��,�e�d�4�c,S��B�z�����C� j0_�>S�f�F9t�B�k��.��e<,�'����N���6P�c憙�	p*|*� ��s�Ҕ|�X-����?�����x���p/Eޑ|���H�!C~������,B��/el����Ǭ�x�D�Ҋ.����x�Ȇ�,�X[v��y���kM�TJ��B�
���¢wV��]�@�TT"-W@��¼C�}�R���Z� 3 w8�G��|�1��j�JW`�M5��^#�8ztɞ���1�ҵv�*oJ!��넴��nW1a�`,��N�~�{�L����74�4����-�����%����i�1{�ު+�Q�:InL1#�D3��+|,҈L��>�w��jB�G��}墱ΰ��4�+�ӏ� vK��ɍ���n�N�E��^�,^�:-)��a9Y)y�-�W��YWw	yO��F�E @.��|���J��GX���H�Z;��^���
���x�/i�ib��/��w�Mj�a���[�Y�?g��q6j��7(����WVny��.p������>���� IIJ��|��j]N*�1�bWJSrz�r����]sU��(�Fr���J�V�C,�	
W��.�!���Xb��t�?r��r�F:C�On����Ь�3��<��S�}�7��ˍ����i��M��97�Qr��u���N�;L�Ү�|:�wR%F�Kd���:�Z����`_ ��N����SM�4�F�)���cf�q��ms�ԫv��z��K�ǥ�Cz �K �\�r��֮=���D8�7��2VV��'p�M�z-�޼d��f��Z�s� �EG�m<_-�d�L~�|I�M��_h�?ݨ�g���o��G
���?=_���C�ǻ�6�1��#+P.�:d�u�^!W�����4ܧZhԋ��$��դ���G4����⳦���a(U���\|���+B�<�^��y�)�k+�w�y�<�w=R�x�'|H6c,D���~��ǃq�֣�*��d\s��*m）P�E_���:_�x��_��w�/�*N�8��.h��w��CWp�����`��0-��ͭL����ao��Nu��ᅸ ��ee�����757�{Ľ�ߢ��"N�iܮ��Q�n�^�y��_�2��{&0��{�^�,��	����f#;�C� �*n��ķ�캊a;7�P�H�qe��-֢�;�rQ��ͼ�'�Odo���B������o�_v�-vt�vM;!)��.q�ך9j\�#f	�[�#�]N�p]@�{��'ss��g6�v�K�m���h3�X8�k�XGs�v�צ�6" 0%Q�.[\�Bo�^��Ō$:��i
&�a1)��s�����rkk�6LX}7��BA-�z��c*�	7�7+�:�	���f�Iɚ�̛_�x��_rD��K�=پ��G�cT��JU/��?{���Ý��oP7t3��0�'_l�􂱆�
H��_G.�B$!��XVO��e��n��𾴡��}���{";����D�h�}k6R�TE=�s7�[Y餅8�Xq��3Q�c��vVg�Է�f���鈖H�!<���ۻ���7񟯭���_	}��H�(���!/�cz��0�^$��G�9M��� (�h!%@�^�!mO-Ȝy+��#ǎ|"��D�P!���f�i=8�ɶ��%ۍN*���w�\x]�LU���:y�U7�zϞ�+t+����1'�}ܚb��+�;g"`�7�'��{�Y��¤ۻ�~����֟�����"#���=`g�/.YZ��;��N�aJkiby])/˕�[��8�R�9�>kO��8��1�a�@0�,�)�A9(���J7�q�����G�D��5��U-�B��A�WC]t(��:���C|�%k��	��&�鐣{�J��t\\H�x@�W�)�"#���K�F���#���!b�V�膡u���r�����،sn2�M�K�Dݥ��P�t�*�4��F�hV��8`���n֒A<��:�s=��թg�Ǯ��� #�$Ӣ��ݻ'l^ɀK���t�o	��n�6ֳ�bϝ�zP����1[zܫC�uyUf�Β�+�_#�[�Odod��ȨOF~^��= �Ϊ����C�Z_�9�� ]�6���[d"%�X�W��=�?�F���{W�Cﰓ"%�6���]މ�]�C�sZ�"��V���V(�W��s��ws��?�ΫIN%��׻��'b�n��6w�o�i̧�={F���
�@=�tUf��d��vY{:���A�ZNް�W2=����zb�増?ؒ����AmT���=�?[���B��s��rS?U)�>
}$��?^�<��S�����׀�6z)�}f��1d���]n�ݦ+_5����I�-��[�[�U�{*B^X��;���u����~<�A�Z���_����j�J���!I��&+%�I�j\��K_)tQ��09�g���|�������M_�������w�0��E<�G���9���ˊ�#8"'�[����Dn���Lh��N@�uih�ܞ��M�u7|���UM*���O�����	�����)�TO�(��zx]B��wE�Ffl�I[Vu���x��:�Ɔ��7���ʣx� �>��9��D��u4K���ת�����~������Z����$4��j�P��r���4�vI8xmZot��0��wg���9�In�H�:�#�1o&M��W\7#c>�:Wo���[+���|��݊H����NY���u�뽸Ԙ&����a�����Պ�����,�MT?�*�{�#e����?�47H{�fR�7�����p�����~��N�}��O{���]H�_>���Qt���j�1�e��|��>�@.�OP������s    ���|���.��휻�2�]�%���<�o8�]��I�"�(��h�^�K��9�iM9�D�=��$�)<�N@$g ��<% /�+�xpC�vK�*�Y��2�:{�gk
ӌ&;aa����l^�M�/d����|���p߭�ُ��bn^����L.K�����ڍ�����Xt�Q�2������31v�
K �\&ˋ䰟/��[~P�q Sa�u�E�M���o�)�K��Sn�n�*����c%���x�[�1�;Wi-�����W���{�Ɉ�氘f2�7�>���?
�_%�9�&�s�,�5����@�+ھ�m��xS.ͺ�<�=�{�0�A4�u"�v���n�Y= z�C������g]�=�
�Q��96	��]�p�����G����P�0�ftc[DE������Þ����1v0c�U�v������)�%�sS�|�]ԑ������V�d6D<��@���u�h|a�h~1��?4Q��ժ��C����Y���¼�/}%���"4~�t	���#?s����۴_od��h�Ŧ�-oj��V�L��{q��3�F[�΂�v`��RX�\9uZ�w��%F	>�'�i4�=�E��\JGv��3rY���lt�x Ex��ho�&�T���Gn��������/l�_+|����c�O/���p�=ʢ5a��9�7���H�\45�݈���W� �O��{E7�7b1�q�hja�GX[��|�{&�3�>�Ujp��U�aCEH#̵��Q���uVIƹ$���4CG����ɣ�Lu�$:8AW���sζcS`Y���g��N����W��j��[}!�~����ݎ8�R�'	���U�{lvU)o_h+���i'u��*
ɜ>��Fj>��ݬJ�Bë3:�+��q�&uv�닧w��w�ET�'	/��}`�iJ�~��J�h���!����`�R	,��+��8����ki���m���!��w�/V����y����\���_�.d_�a�<f?����ŷ
�+�Fx�)ԻI�Un䦦�2M0b�B�^ț��-M����r�u*V/錍�}ď�[4 87(j�ڬ��vz�������65�*���Q'�/�6�EZ����� �]�D���� 2)G���:3�fE?%6��Ԓ
G���ce{�� vD�__��� 'K�ͬ�'_�.�_��͏�_��!7�`0�ji�f��ͮ��Е��y�?�y�(j���k:	��C+�c��QmEҸ��zS��ɖ��F�R҉��k~:�b;/Q�[˽�yE�f�w��W^�?&M����{��h:X��a�NkN��-D!8r{����.�00�f֊�'מ���ie��'������Ŋ�/4�����Yj�C��B������e���ݟ�OE�N5=��
�$p�v�G��Ȉ�,�PT�y�ɥ�Cc���	#~@O܉�eUq@w箄<�������^n7���T�٦��
nk��Pho���z��3�."ԞSr%��DX
�'坑V=�"�7Zybi��0����D��E�׳��O����׳�m>Y���gJ�����씀M�o�����l����N�pGܟӀ���p���[�F!�;��Qr��ǫ��X^ (�b8��BD��-�@�:�8خ��/��١#ӝ@��^���v��F� �3ig����]��B�ӏ��VϧVa����P�U���!꣫^��s�7�������r͋�yOj?+�Ʃ�ӽ��� :�kQ�Xh�����S���(�S����ރ�v֍�D�\��Or��"V+,ѧJ>�d����{�	8!�*��Iw��J'��Y�1��ET;�mZw�_Y����˅X{@Y;GJ��"��z��&�4��k1/m+b6I�H�9�*'Ɍu^߻����'B��� ?=�A����_V;p�xH��݆a5�d2ﯔ��q~�פ����ѐa喐vMK�H"�;�w��=��Qg9���kd&���+A�߾o�F�eĬ��F-5��5-��h�z���EE��1�+�/-l����f����:C�#�$YI�h�	�}?���ٟ���v!��:��FZ������ײ���Ǎ�K$���Ƒ�*l>j�f'�gBnZ��P���v��D�j�,Kh��� �o;�V��n垍�k7�zø���yB��9ΓS�ԻqӨ�ww9#!X�gCR��G\U�����H;�᧭٠�������	̷��i�ґO�w��Ғ�?��o�ߟ4��]0����q��U]�b�`o�(��n7G yO�X4Zϳ���ML��6@bkq�A�A���\�9�S� �����VI�!�!�4��hל�%	7��_���P�(M���xn��*�]D|��bX��M�0� ��A�HC<6�c�rA���c��z�p6 â��Ī,���_�.���yF�c
�����q�r�Ss+M�{��=��`+_s7y&��0#��#E�����#�ތF��Ή"����6�Z�*6�/��NG���)��;(a;��8ԮW�<�m��yL	��66씫�-��٦�v�?z��VĒ��f��=
@�ܗ�)���k���M9{�������Ӝ�Ӹ`��j���Ƀ~����K�h���}fg|5`�k��H2�0�������U��̭d�Xl��@�n�*&�O�Ս�-�#
'��LXA�g�x^:���s����2�����4aOx�W�R@擙boJ����<@~gXp.�2r���=��$�&f��G�'�A���_�.d��_W^H^���X��S:��h�T�M`n3���9��wABB�@�z8�I����~�@{�Z��d͊��T��B@�R^jW�)@蘗liVضlR�,�cw��K��-:/���
q7g3� e��^�:��<k\q��t�d���l',��ד����F���KW��y��N�5Y�:�~���bI�<�q�_�ӳ���0+���c&����zoU�ݲ�
:&
ЭM��@�^A}ۧ���t��s�Ro�/����w�t��6]aud��-���pY�F1�QBK?w�g�XF ?U����cm
d({}�)���RXF�2ӓ�=��� �x��@muyC�r�X�t�WFa��̓{Z {��;���q�z�/O��)��y�(��bR���������M'���@�,�u�2�	�����i�)�9��$-:�����"��o(��Dyo�5ܷC�*��W"�����n@�©Y���v�Nsb�(�v�H�:y�7T��Na�J����1��@����zr3v{��0FR��(��������n��;5�;W�$ǒ�q�+����6���L�܂*OH�[SBغ�)\?�_'��$���[�/4\^T����y�%WP�[��[����O�*�χ��\��c�1ӅH[W��/l��]�S^�h�L�Y�K ��b:���A�3}��̋�� 8[����s�WKDߠ0��|�y�t>7WX��Y�����W����.��&�?�E?��M���L���&C��iDڥ��}4��{`f�+����Q�5��5|R�:w����J��`������I)Rw�6]�eU&*�N=�s�1Ք�<���d�OI�:��p&��<�	o�� ���_�	<�Kv�a+�H��n�����'
�C�㹯��"9Z*�M///����ݡ\׷g['��5	�] _LA���\o��!�	����wQ�'��r@U{n��"�H{ױl��x��N� ��5���R�Jn*b[�{D���rD"�����J�T�V��t�z�q�,�uې�G:8�-�z�>X}W��S���]}��}]Wt��l�ǳ?_$����Ȋ<m)U�G%����iBX�TXy�i7$��q�t��D<�ndEPF�0;�RRޖ�y��X2+]�?��e�b����1![F�>$��k3�h�tږL�Y].��>2
�M�+�~}S�9K�C�,��6s05�!��&N�|&s(Y�Q<O@���#ˊ��=�    W���`�7���4����jʗ4��_W�W�[����]�m�?|z��?%�UNI���oy:s��"6���2NS��K�~��w. ��2mC�i��ٸg���b����0s��n$Ԭ��,5���|�p*� �����Ƕ��@��`r,�d��&F�'���.={@�]���
=U��&	���&a���;Q�����?i|a�h�z��ib5m���d��}z���J�w�Պ7�D)^�W�����-��HɌr�Е�L�^E�V�rt�� �
?����Q�Ɲ��,� ��E�<��.ym���h�'1/-pv�r%'+Q���̷i�CZ�
][�Esk ����Bޘ����Bd&"�� a�MT�}uy/�}X��F,5/Y>���v��m�?{6��K�|Hq�d�(�b}ZB]�iH � �]#���Xn�\q����2�+%�����E9W�::��l���Ni&ы��x��y�L�x<n�8�5�4�	͘���[��M�E�SOq�����=/?u����=䷻b%�(zO�\�4`��nU���<v-�a���<p+� ��9���oh\,[�����������\��DKGw�a#6�9������
s��n�qw��gΈ�2�N?�x�"�O�B�iBƁqb�JN2��KvxV=��0y9�js�{�b7�;U�V��R0�Ӻ��z�H��5�Ch	Q3��"�}���C�������� ���-C~��c��9����_Y�~���/l���B��L(C��H��1��n#	xY�Nkƫ�<7��m��	�$Z��ϐ~{	�)�b���2�ڝ(z�4��%O��^-��P�7Gm�c�!��e$d�%��=`��M9�#�mW�}�6'}Vn`��x</�����6�ln�����;F�*����Z��v��`�F�KUE�0|��fKm���|�i|a�h?v��F"?����^g�����I�M~���J���:����O����%��r�H�̘^���l�Zz�8+G���\nՎa����b�=�,U�Ld���dNm�KC�s0���S|	��$��ѳ�ܷ��㗴�"`\W=�=�d<Mه�M�:�(�i��B\1��u:1<yHuY��������/l�?��'��_�(��*)�Q���o���h��N�h�M&�)��~?�h�"9�<�oj����@1Q�(�D�ɨ��D�6�G+� �t��x2	����ǧ6<֚�NHhpB�����[Ѫ���'�:fXܵ��_�0ѧ�6o�c�$W�o��^�
�����q8��ó��{�6n��� ��|9i�vP2��-+�mv�74.���o�9��?�,����ͽC��]
�<��~f��#Ҹ�n>�ѱ� ׽��̀�1��r�N�2��L?��Ω�H�W�CX�M�sD������|C	Y���U"=k�Ѱ�Ɣ�k����1([���"8K��������&ˋI�K�5�I���`��� ���aa�{�I�2����'�/lM�7~� �qOʏs�_�@����!��c�]��� h>����Iw
M��L��)*�d���\�*��F��y@2禶w�Rq�]�\��rzt��D��6h���u����9���=�_���o�/Ч���!&�m���7,��-�������2��J��4M�Y�NS�|�u���({*�\��74���(�?;w���q���M4�8��+��6��!7 ��b��.��`����2���ҟgRF?�/�L�����S���
 >e��R��G#4�Ki#�J�8�G��4w��� Q��]ں�/���I�Gb�Τ���"Fɕ����<�r�1.f�I�\���2(�3�`$�;w~n��ٯ���g����F~�6~���6Q����k{�n�@^K�45����'u�Z�8D<�`�˞�I
��4Ĭdm���nU���x!�'=�UO�]��F�J�u�^�}/���%A4�+h�9�3���SSH����;��AI�T�'���nt��IE���d�Z���B�}������7v����Y�cg�7s�z�H�z�Oc�UN��8�ٝ���m�jލ6-A�P���*˿ƣQO��r�AG:V�q*g�5��n$;rU����p}��G��)	�e%u l�!EXY��`︷����dP��� ÷�a�H���`�������Ceq7ho�;� t�T\�f��U���u~�������hb?u`��0��ر�����A4ܷ��vEH
[4r�]�0v�3�4ӑF+C	�N ��@����F�A�����u���<�Q[l.0 ��Ћ�Wٵ?��8p���GKA�љ60T^���K4�Ux��4ȝ8%#��Xq�L�'fQSx2�mB��5�JUt(94h�@S�Wx#~�O㢉�h�з��������C�#*L,�͘�DZ�0U���&S�S��gX
7=�����3S�z�u8�\��[�-|��ᡎ����7�f#q�U��0%��*EJ7��WpÀ5��u�<�4���kׇܴ)�+��  ª��6�OT%�XI����ɒ�e*�K>5c�(ği|a�h����wԬ���
�ã��J��+�3$�����w���M����F�lo<�=��RwM<�Ⱦ�}���>�g&�W��Ѥ09��O�E��-�R����S�SW��
�s��>'�u�S*v]�����R���g�]�~Ĭ͓����9h�ӸT��8�c0�V�p�=3S�C�{�D}���3�/l��{��+��j�x��k���&yNֳi�0��� �^��H�\��kao�ވ)��/�ۤ��ō��n�ly��o�"�0w��F����o�M����_���t>���1�{2`�]!  o���G�����e���8�=��PP��VG�2N?Πjqq{��n���h�>8M����u���`ԛ�gs�fs����3�/l���h�x���of�lô��b�|�p��=D���=�i1�YS� 7V�@d��{��˳ ����NZ;�,��;�L#`�U�
�(/�:��]�5�yu�,B]�p�4�t����8�՝�ҀK�"腁&�d�d:�p�P�`#��h"��Z�$��?t3��niI��1��Yk��oY�I����M����*z|�Ǒi��x !�1�(B`<��8Y<Wv��%1����"0?�{,#�]��
M�(:�D�^�|i�l��i�!�I�L!�����[\O���Լ(�R4�����t�@߯1�0�r��d{�:�-�%��=aV<Íbv�Too�_eLߐ���/l)�;R�w���ǺQ+�t�i�趂��A�S��;2��~���"X<}ڞ�E�'��d�W��g�Fπȕڰ��q��)wf���	��|�X
Q�%�Z��}��l����"�ǡ	�e4����,��wCՌ��)�c& f�ZM���m��%E�u��O�����C�+�����~�����z6�Ab��6�alN� ]�6�-�
���v�}���6�[�G-�qw��d�n����M���27��αa��HEm|�^T��zɐ}G�ќ�顃�u35=�aV��@ҩ�e>ZؑQ��"5�ꋵ
�+��q�: l<���@�p�B5�UO[�߬�gֈK47�,���#��i\4ΰ�1G�}ww�__�^���`���c��0b��^{�Z��Cq/�2T���Xoq�e� �;{��D0�731�w�+�Uv��+u�m�7k�$�m���Ђ�1����t�ǭA�&�L)�N��G�X@�Si��`��l[$��$v{G�绚_i��<v!���Y;��w�h|a�h"����~����u���|�0�3�@�����.�Z�)Ě�ҡp��O۱r��юRV	��$��	\�7�|"�$�b�d&q�t�����jp��'&@�O-�M�/�xLḞGF���*�����n��1�"�C�T��v�E��f�,��2s^;՟�]�]�l"+�F'���V����'_�.����%�񟓚�s?v[|�"�xp���#˕yˀ�K#G��S��R    ���k����X�'o=�Y6�|!���a6�<e"2�mtOe��-���SQ�F�EPrK�-�{��R��>*2�5�ƾ>�6%�X�	J����n|������ B�o�1)k3���y�����E�\:�.?#��T��b��4��]0ޑG�%z�8��M��Ċ:S}�IhyjJ�I!X�ˀ�/�B8�)����$� �aR���\��vwy��-�n�{Y+��u�#F�[R�Z:��g8Ū�6U��LPo�2���i��*9*}���d��r?h���&������K���T��x��͂��*�ٟ���v!���է���ϟ�$?j�~���0�E�#�qkD��!������� 5t)�|N	A+�v�LM�F��k� �mԞ�7���49ߑ�lߘ47�]蔆XB}���$����[�β��9����L!ղ� �4�i��Y�Yob�<�%�be��^�Y�Ɣ�{<I���dOv|����o�Y��*�.�����b��)��e�q)�7'�T�Qҗ0�f�>�Q����������x��(-
��)���,����k�m�[����\S���H��v�Foo>ݗ�z��f PP7��f�aC�O:MI��O�g��ú"���i�ۭ�ɤU��P�>y7�`��<ؔ�*���i~A�Dv����͉|��rx�xmRs��%Q��}��D�����3D������T��w���m\ �{�j`�F�F�Z�d�a����B�E	��bC!���"�ӣc|��������s_�������]�­}�.<�ɺ	�\���
�5Lb֠�瓫X�;s�)4��҇�I���ۗf����8j�g@��6�b�w�c�%(jZZM��n�O_�.��ߌq��25�u�[!zW�{_�M�3��!�;�9�>����ݙZ�F�ȷs)dv�x�6=S�^�	���2d��ڄ� �g�\]���Q��C"�_j�҄�	�ٽ�������o�p&�q�e�����4�60~Y�N<u�Ue�=�d�h$	z���_;(�����v���l}��Ic�^����e��Sռ�ȟ����
��"U=��M4�1�eЬ����dp�G���Rd
��7l�<�?��)
��m����!�r�g�?�7�>�i��}��jm(��^�\�8�_��AMJ��deL[��H��$�_+�R�OC�H�/���ޯ_�۴mlȻ+N���EbJ�A'y�d�"��}&�{�D�U���_$a�c�����_ʝ;ޫ-TMEw�J^G0��\���x�]|'n�I��I�{ٯډ���xB�r��`�͝�`=���(x��
����8����|����̢�lV��j���_�~BY`|⧌ʎQ�-�XR����y���ʔ�u�<��e���7��s���]Đ_��e���QU����7�%�q��KZK���G�Lq��z� L\��v���	������k+V�{���<��������4U@=Ȉ��A���������z��ڕ�6�U��;��q��ɡ����y�-�ai0m<�^�{�9i�*��o���Va�����?�3l?�XOž;CYxo��`�p��Hux/���1�}���������0�l2&���m���4��|ŷi^g^���i���ec;+�i���c���������{���p�mK�[X�Sv�5:��&�Oﹻ��Suēz���I�|40V�� �&2=D�����S�t	�5��R���j}��>���v�����0q��Ŧ�-�)+��ܣh���Իz ��(V/Y���%�H�ϥ��d�t�H����KmK�B��Ȥ��������v5���x���W{di�'(��hص���cPUbGo�sÌӢ�6�O�*[�&���㶴�YKg��~�1�Nd5T�G��Vw���;��
��>���v������=G����������BB�ξrO2�[�Sk#�}P������nH6�k��81Y���x����F���=I�H�F�t�A2�e?�2�F�z�{CP��Nعǃ~/6� �{g�O!�԰[�N�vH�l��U�eN�}pm�M�,~�c4"��*x<b�{����C�I��0ǿ/��g��}�7�T�/W݂||����7�iq����w;�nv���n�9����X�
@���m���6�^�Z^R7�2t�-T�P��t]�a�t�* =C#�M̦w���X$3M���:����`i0���Ka0�>U�J�@ճ|�J����X��mν�շ��3��R�3�/l�?�o��C����O��J��7�y�2�W2�S�5{��>y���=�����*늴����Lm#��x��6�\)ڱr�4h�&��9r��K2a�D������9����.}H(�߉`7m���q�d�	�]�u)�������� O�]e�A�v  �%��<$]���1��	��-���sHSϷ����2�i|a�XR�X��zD~fI��<�5�.-�l�7D���$�g�Z��4�"��D�S�G*[DdB/mx@�᱕ـٸ.�ȋ�UL1�2	�!����!���+�bT���:��=(�ƭ���}쩕��қ�3N���<f����i8>��0�o��_�'�����7�ր�7ѠbA��ޥ�	��ދP!�;�ﷃ�O_�.���3<�\+�c^�.c�1�u��K\�	"�k��"��-��-�b��T�k�P|�L��aEP�ڋ����[�L�mM�y�F����V��]n�;R�d*�+5��\�>������#p���f0XG6��M������a+�1t�2���s���F���iM�Mn��Nɟ[���(�S�Y��0�ӓ;y��Sܒw�$�
p���8��Aҟv��C�3����!�Z���SDo)t�pTx��ɘZ���M�}_qJ?�y{3������74D6�0%�8;&�H%g�W�z���.A�Jd-eu�����$ϕ_�tW.�^��4̑����K���~+`��0)/��384Dsr}��u�����L�����FI�_�����sGE~���߭��,u:����w�YV�n�~*oA$�!���S���qk���~϶:X����{d�~W>�S�קܠyD�n�6`�qX�Y!�:J��<�J=�1����ʒ������QB�?��ރ� wbA<��g����'�� 䪐��J�v&��ƿ�%�����S~��Mqe�̷!��/l�?�d��Ob�|���?״%�\r	�b�4t�9`3�ſ�!��sn��~������B��4��GޮL��� �}�ܷ�'�\/��e�zL	��(*��W����X����+wF�:�u�4���0��M|��X�Je$�t"A�����y4/���?Z��s�6w�Г�/��l �-ci�`����Kfܾ}�O�b��`�;��ÿ)8�?��0�#�&��r��Pȓydg{
�GX��<`��X���0�X����rK�� H�E��1�����8�j����&�w�x���3sw�(����N����}pt)�-!نF�i���e��n��x���i��f�n������⽙U�58|y��c�]�̾W8�h|a�X��/?�|��7� =�	��1ō�PoD���u�}쵣��.;S-�q?�ԜL����A塽n�f�i W�X%_or�(o��9�y�@x�<��a�c7�����J��X�0�~����:�/G�t���b��!
7��]`��Ov۽ű�QgR�>�(WN\��>�ty��j����4������_~G�b��}������	��觨��j�O*а�T%�$k XQ�1�ˁ�H�7J��Eu�Lq�j#x�k�o��P����!3��0p1���^�gm�J��HN���rZ�i�7�mt����g-//9]�G��)VV����,z�?������B�y��b"�W�To���%�!z�R�a$B�>%�D��Œ��~�Q�����>Nʎ�=�������d�s�l��)�<�e���Ȧ�h+mAA�S���4��W�%$�a�܃2G����    ��GŸ�X����'���M�_���<�R��B3+vg(���v:�:�>���V9O��NB^�Tv�y��0��v��w��:�J��"߫���ܧk�y3������oi\,ɿ�ԷwC��S��ӪYOo$%!����w����J�������ơ�U1Z!&��X�u����o��]$)[���U{JW�y+
�<'-_�C]�݆�U�����)����J�49�(ңx�	8�f@�5%�kZ�, p�~�����"���4���I_	���K꯻��],����c���>���F�����u)��D�aZǔM�v��s���U��k�=	�G�2g�e�z�x��2Rgw9(�A�egg��[1�bu��>;H��:�[2�&����[	Ҡ7xy���xD{�y��]�х��Ɇ��7�s�ϣ,�Ge� *V�@�■Z"ש�)�F��gH7����u3���L�3������I��-͏C�_�+c@-���2H����0C��,���R+���D6d�_�Sc�q�T�w�F�e���4߀���2��n���C��3-����U��,��ǈ�f,$�d�ΐ�-|��yl��ڏN��t�ah�}�uL�F��l	��a������x�7ù���K�f:��8��������(�o��#k�����Z)�M�l|u����K=�2Rq�o��.-w����;�~�H����<N�� ��S�~!���Ty�W��Ū���Q�H�Z߆���d*^Sn��p�Q��N���퓁]������N���͸��aDƇ�2AA4̴Y�_�MR��[�SX��7��q��/l���{����%��D:���5B��q1���k�=�3�tI�rT�����c'H9�O�UWh�<.P�i��M��8|�'/��5�ǶU�,�YH�9���
'V��o�(ɔ_����My�����F!�֗�+��S����g��~0=Ͽ�^���ø�P�"���պ[z� �Q��\̉�K9Cg��/3��;W��-K�Ϛ _�Ko�vU����靭�)�<�Ř������vI�s�_a݃w�������=��ˮ����g諭kի�2��S���̈�]as Y|���z���=�fsQ �JVn�/m��`J܃T�;Ԉ�nܤ/h�#�_K���/T���nE��h	��u��2�+9L�s�CU���[��9z^�1�)�H��p����m�%�
���Q�E����oJK5�ߌ�?i|!�X"�Ջ0�����ͶV�M���	�>_1�3;Rce����9�(uNDF�I{�/]�:�'A���h�Ι.�2�X�L,�.i���-ۯ�������	�JN�^*��rb����+��֍�_�����+J9���V�}ý-E��s�|��W�F�y&��;K��������*��i~�/?��Bv��k��G|.��`���凃�k��~k�� �$��&�͢4z�@_ʋ��x��Hì>:�U|�<a�8�=�Ƥ']C����2�2��\n�Vs��+��ƪ��.l2r���ַ�۫l����Y-.2�;=瘸�iA!i����$���FX�V��"�����e/x@� Kۖ�)|�v{����Ɵ4��],���}�f�}8��9uq�zR	ԭ��_�� G����������6s[Aa���G(o�R�ם���S?� Z
J��V�hG��P}����!B�"pP�w*5�G3�O�y�ovb�٫b���s�Q�^H
HC��.���3�Eq���}S�����FsK	R0A��e+5!X՚����Bv����}d�F�'
����ז$��ڨ�����T=v���?���c��O�իIr�x�$)৺�@�65�<�ޝˠߕ[�m�'��hz� r���j�ne*�8�15�ǝ�8���=�;"���*�$�:x�L�"`��a�j,�
���1O��I{���Nb��,���e��	/�*KK��\*sY�y���<�g_�.��ߜ����G�u����),
ҝhЃ�f��,�mgKp)�њ`�C����c�~T��波�<Sy�,)ya;�ܠ��=�w�ʢ�ǈPts`�@�
o}fe�\�����k�m����9a'z������E�)R$u��#����P���t��{��H�;���Z���BF��~�e'>_-�@�gBp��r��d4,�٤�H�S�L�XNMF��ܚ&��ѩV���^�hJCG�ڌ�^y�T����X�r�q4����^���������?��<�a���!���t��3��D��7��ýOKt���{:�����_}\�װ?�x�n\����x`����n�{?!'�~��5��&���迤�#��7r?�|��x����z'���u���;ɯd�B	蟽��|�獯�ʮw����G����w��M����z'���A�;����]ʚ%�̹�6<���9��C�Pbm|���%��b,�i�I��.6�y�!ݚ�3� f���W��^;=�q��]�]O�aQ��ѣ �O���L��v�#�@�*��Rzq��_<��h���[<�q&��cʽ�w�`u�_H]�
��\�잽hͣ=����,}*��4.��6����Mh�����7�u��âT��B���|�Y_Ȯ���ބ@��M���!���D��S��?�-~�����/d�w���w�?R4�]��̄`�!���9?�l	�y*�	xĽ��&�Ö�ZjZS
w9����-��BO��2=��[�x����- ���U�z��0� l��g�yt��U,�k�^�Y�-QF�uȗZ�&�V��ujЦ�$��������ʬ~�G���
 �?^�  ����|��C���`��bL���wjk�G�
ܫ󴖶�@Z���^�q�K,�߽�<�z�����w?�	��T�B.�jpE��w��а����:/4�E@���:k�3�Dw��ː��;�|�|���V�M6��ټ��TS�f�g�ޢY3��\�7t����-��c����̕9t�s�'\�-&�g���&����_�E��g4�	kEGjGA<\����E�c�dz�2��A�Z˅O�@�9T��p���\���@�O�hp}�b>��Q�|1�%�(x�ؕ�.����l#y���kLzQ|^:�M\��n���!
������$�p崰^S;2�&�rm�H:Ak;E�������N�+}���K|�dM�2������ �Q���ſ>����}��x����_(	��wRG��?�������l�x�7݉�!u��ށ����PiE�J�z0�����	r�e AB��1Fiy�Kׇ`V@����V������KV��Gw�����,8���ںT�^���\�۠N�Cgiw\�Cl��]�,B�Z�7l��]û)��)4�`�ˢ�M`��coL�e���܈(�^n�v-�߻-?��Bv��g��K��^�?nvl��E. �\% �>��<pl�m���
�Źs��ً�՚��17����L`�~�Xj�� !`����0�w�>�G�3�b�&��5t�1�P��c>5DGa�O���Ț�l�k��\Q����p���Fh�JR-��W<��v�נc�AH:rG����wa�K���?�����G}���&N5����&���Pfb1^^6WO����3f8�VwH9�i<�!|#de���Ɲm)�T/m��fvB"%��<�I��:�

yh�#Y,��w�L�; ���I�v��n�.CQā�}��b���Rf��A1g4����.")�`�/��	؁���ְ���k������E�'4ɿ�/W}��ũ'Ԫ��ن��M��&��h�T�����RUIC�.:̞,MD��9'K�Hʳ'�dv'�b^*���*Vt�D�S�g��� 
t'Ebsjd��q����܎ȩ��Sl��6{�L�lTn��Kg����4DMT�z7^�xs�W��9��.�
�;�u����z~q���4.��IBL~8��k��ԋ���4�    ~����f\�43hZ����X��8�//��o6>*��>/$��1u|���Bgo���F��J�U�a=���<��\��b��`�-X&���j�x��0k���6�g�O��M�m'މ�ѿex�dȫb��ے+ܴ]C~Ј�I�O��UF�4��z�w'�X�:t�:N��Y�����5K�GI�[�k�����'�	�h��Qލx;]6{�	h��",Y��n	a���K�d�<(�#�=�cVf{}=��|���T�n/��$X�F��7z��x81�{������j���Ʒg6�XcI�5��$n�J��Dw��j� ��{Ds�����)�V밪z��	5Lg��['uI��;/M�bI���G���U�p�SY:��f<��e��6Mu��M3����a����~�މ �
�G��]k����>�d��)ҏJ=PJQ���>�=+��%9��s�5�ù��8�^�p��z	?$�=�dx�34�<�&����q'��<����y4���BJb'/Uo�=`^}��'�d�E{:�O�?C��~�+K�מ�?��?mp������I������e�5�Uo�wZ���}q�T�#v¢I�u�P��Ux�Ə�v����|?ABE�\�Z�{��i��ץY�ॠ�g*�J�(�3LEj|U��a�N
]h�*�ޘ=�xO�)N�hj ������L�,v���Z��GZ��űE����������h\4��y�����: ����6���Iu� x��>?؇Y�uo%�O��(v���~�/tǂ5��}�;@ܫ���/},�2n���q�)�uPzZo#�:V����|���Z/S=�Ԋ�&eL��i�ew�֎b���(�?D
�"ݑ'�U.�q��������j��������`�s/�'Ɵ��s^g�Z�T����H��+�Y�� ��=*Ã�a�/��|������&R�ڵ�~e�oiR��,"Y��\�����М؄�H��|�X�>���Xd�,�4��a?!�	�g�6�7d�a;!x�뙫��_�����
I� R�<�����P���{�J�ˉ�4��G����K��'?>�Gܒ˵Wܫ�5�D��w?��s��ZS{�-�m�%8��A�D{�#o��p�>5����VF��$IAL���K^����s�ZX	�Z`�<'�EU�j��F���r�iyی����jl���_��ߔ�܂��\�B���ݲI� �za��d�����^�J����kWτK�w��/�q6�\�]��Y#�Ӌ� �(���j�<8�ȑQ�9�&��y���,�O��M��z���iWQ~��L�d�%����qP������@�>��x/)=�R�SN�uw9�`��F�!�� �ۣ6����F�/n���="�ON��()��ѣ��QR�]���i|!�h"L�0B��q�B���>N|k�_�?_��Bv��0߾�z
�7�`  a߈�*���^�Igl���g�,�6_��<�}������D�*�b ���;�2����רu��[�2텳n_�BN�&�.#�H�0T�.���C���Q܋m3o�K�ճ�<��-L	im���M� T���z�IF�l� �{B��?�_��Bv���O����m��6�|R�5����5��%h��0��˹aP�LEC_�4�Hl&�=���o7�2=���yiN=Q���,���Gz�u�o{S��LQ@����9#�:��V)=��8���RC�X�������A`���*���6ߡ����cz���Đ�<��٧V!��Ὼ��gI�c23w�k�Ѐa{�5���!T�ʬa�u�%D��S]��.����Mofm��z/d#�A'oVhL���PΕi �u�F�#�W��Dy�~���t�ݗ��FG��f�����R���͵�̰ߵ΀/��
G���@yH�V�D�D�v	��w���_�.f�o�������}}ĝ��(�˓rך�S������������'��yz]��'�7˛)`ܩ9���GKA4<��	�j�-ƪ�n�l��r8�/����ԛ43o�S���s��NE�c�u{v�`d�뺭':�Gݘ�d.|zzbeb�2ʰ�O��~t���/d��o����[�Xİ�~_��|G�Ap�W`B+^���<aT+��^�Ж�d�bGئ��x E�m��t��m1|���ͷ��mM��!�K�e3LO�H�~�㚐�_�����y!4���x{��CeJ��ز]V����o(Hd��5`�'{z:\̸��w�K�ѯ��o�}j�����0�����G������36K��,���Q���EZ�7-�~�	&ދ��so��H5twM /��������1�9PT�����M._whnSr7/�:��Z��W)�����oVZs� �Cf�Hi��Q����rp�l��$�z~9�}~��u�2m�ϭ�BvQ�{*�/�A[w��]R�@.�Β�&C�)o�h�d>0	�V�f��j8_ġ��G�m�o̮��d�*�	���x�3��s�E���h{k9�$C��{��5��]�>eF�D(���M8<+\�@��&w5}��[G�y'I6t�m�n�{`K;]��8�Ռ�\�ZX�k���Ծk��P�-�?�~�s�S9�*~(6���s�c`���ƥv����l�v�l��)�Ζ>��$H➣Z�
�n�	S�ś=���Rt�	$�)r���K�#�����m�Ϣ����!��-�����6;�ig�gI7%HJk�r*]K��&?��{j���E��8��������ϣ�8t����A%>.�)�9ı3~�����V��Z�Ox���� ����lj8ޞ;]$wG�m�uw6�d� f�2I��t���u$E�-bG����3"���x��3,�%--��M�>�o7���%p"{�L�[���E���0��m*ϒ�5A��s�л+@�"����/Z}QC~G�Ǒ��B���h�@���P.��%"�{�2���gs��㍕�v����(�B��G9�,�hأݏ��U�Ldؗ�k��JŬ�Ţ��}��rџ4e՞Cy7��)`���J!V��GHj������!Ǭ�q�͙�eN\�/�'���Ď�[j�i����_��52�@��OI=`�#��eB�7��q����<1LR6P;��C��o��w�2I�9����"�l���,=����:	�X����n$Ձ,�D�^�����1΢����w}�0;�ŅpO�U��x��o٣!����~��Sòg��#���	�Dl7�#�m��G�\�jE�``�o����5�P�������me�)��e�����y���J��!�3`���y��YD>���`� ��P�'w/Fp�\�w+F�d�z:���a��!Q�T���0��j�X��K!�L1�.��6 �:u��h����̗��������X��c2��m��nIM�x�濤��tA󿲋�7m�F~*�~8^�����cB��t��Y�g��a��8�3`7���wɫ�DyIlE���Ƹ����|g�k���M�M�0M4|k��7-��Pфw`��.��=gg�l�{����u1Z��rd���R3�çC�[�0u� Y ���O���	�&g>�o�|of
u8<��ke�����/d2�Ww7�����(Ђ�<k�Z��T�*�i�
��F��f�V���#16� ��_���ˇ>��j��^�_�����D�c4�r틹��-��^R�V݊��S^GlJ������Nk+���<Z�o2b��Z�����>r3˄)������K�����+^�Z.�o�}j����ߣ9^�ߥ�3~3��B��A�Ė�Ƃ'K��m�I��4�.����'���Em�����=
&ۚ�
��s�E����$%��=�d�B�ұ͹�Ւ8��r����Va����"�w�2˞��
�
���`��t�[P#^�܀�w����*��H��\Ưq}M�s���]Ԩ�"w�0?��������oL)�aݻ2o#�x������XR� ��[#�oܮ2W    _sn=t�`ί~jeX�;��؝� b_����gxgD@J^v�^����E�q-��x�
ʠ�� |0�Y�Kz�L��5�i�4��F��}D0M�|D�c���A�Љ��#t|n�����d�a�sB�������7εW��u����6�"��n�!��<�wiҲ��`/MT�^{���>��ٹ�A%�̚� �<�T��������(@5��1,X���)�Y�2�{w�i;n�hX���i��P�����r9o�Q�^�t�J�d���k�:2s��f�i��a%�rB�(y���$h6JO���"��͎_0�\N��H�2����V�c��S3����-z�����P��x��G ?�^Ǜ� �"A	��y�)��KeXm��ء�`J�#�1\�W�f���tˤ�W��b3.����0JL��	'�:��`0�݆T~��V!������7)�ߠ�çCI#�p�A�L�1Z/-�����������=⩕��
�3��$�r2u�J���~�8�m$B���f	�9����9@��)3w����+đw�EXy��0�I-�Y����P�I6x�MF���*�t2[�B��ʪBG�1w탞��s�߬kjU@���/Z}A�=6��N���Ǖ}��)^�J���I���z��F�@n*�5��7�2��[&����"��;�)p,��O�B��L���=R���wK��X�6Ef�-�C���>�Q:�C�8�d��K�hS��S�*���������ً�i�o�=|�Ii�������kdď��_�<�:]& qLH�Y�$�s(�d�9���CNniGu��&q�m0ʚ�n���ғhh�Ը�N���X"�r5�R���Ù/D�/��F߳m�@Qy{
��{���*�>��z��u%��{>�,Ku\Hʺ;��C�iD�)|NjVͯz���O���&���Ɵ�q�#�V���չn��O�"�߻��E�l�`�L��c����6���.^������Z=,�:�d��]�g�H�C6D�n���� D����\B�iև���`M��%I�w�xN�>�<�w�6|�m^Z@�`u7��Sє�A��Sp�����94�k��ە����q��~�ȇ�����ρt8N����;����z��T��
|:����"ՍQ�8/�r�[�?��f{�3�W��<u
�5�ѽ�$��;|2)�p�eʻ��a�Y�;��=H��� t�f�/5�T�&�.��+���ORl�s7��Ǒd����_�.b��`�S�b����!�]_R��D�(���F@~�-&�7� ���Iz�:>[!��8�����hF���Q&�ѹ���FdL=�	�Z������H���Q|�k����)� �8YF� ;RF:��V�B�@E���{�wX��X/Y�m
�h�"����{������S���]��_�����s����v=�
�������hm��a�㐱ͳ�gE��@��뭽�I���DC�d��8���m(����|9��&��Ѕ{ٺqX��nA�¯<k�j�9�TZ��X�C>�j���Z!�p3��Rj���X��ű-%-�SN�W���zӞ���p쵷Y�e��-gߞ��L��Œ�E��3d�7�[�e:3;��P������V��!�7s}u�Z-ryc~p�����6"8�*Ʃj�b���P�����:�N�>�����&�o�]cs��x�|.~g<F�q��a󡄣�	C����1<����|T��y����o|�g�xqq3^ϣ7J-F^-����_����Я�aK��U�{�e��V�dȢ\r�	r,珚}�V@$)J��#�����I��ۅ(㾦1��@��l=�=-�(����R���X��҉`qf�$u��m�?��Ɖ���I��ٟJ�7X,�fR��z���C��5(�PtY��<)m�>���΂��_��Bv�t��ZAa�z>[����O���Q�B�^�#E;�
�Y/�~��m̟�(��H"G�x]�?�����u㢹�r�QYR��D�z�.u���/	;Ӓ���t�>7TY��;�v��螣e��>���QrI��$O��nF��_�(�dB<Ӽj�6�?�ՠ��JГҴR� {3Ô�`C?m)ޒ�W{�{��74.���+,�~�?R���n��a90ԪJں֨�d�
`�k/�]�m�7Y��6� ��t>k����kLH419aU���~Q]!Q�=�(2m���|�r�5��Vī�����pRQ�]M�مV&�7=��͎j��J��
��O����G����i>��o�ϓk���!P��	U�mˀ����O4��],�χ_�ʧQ%��h��חc ��3��r��=�;!��A
z��f;�J=S��o\\X�&�"#�����W[�5�ɐ����Ow A
v&�b=v���H�6^F0�\�.�.�p���;h���;��Wv<�$w"RN�I>������)�ݞZ�:ss��1��,W?T������eS���/_�.���Yҟs�^��G�C� �ޡw�/���x>^M*�\�n� bB?;��$��W� �Y=v��gĦ$����]�T(�����h�Jp1T�kS��mƢȃ���斳{cX�Vi`��ѩ�Xky)Oѥi��/��Q�P�P���;����/BL׶yL��ƍTi[}�fཝ�:8�=1�ךL�zM��χJ?���qG��痰�a	�.ƛ�ЩX��r�)�uayġ.�H�pD����Ó�}��^������HX�q��}�u�%Ĩ��pB�[�S<u�]�'�ŏ�RFSE��M#c蕼�z[��:	Β`gH�qfB �%���w֦]� ����et~�&���}�AS?�b�`�sI�q��|��m�F�Gb����K	��(�]�o=�_ڴg2j��࣭�ʷ��"��+�ś��A.�/�oy���7z����4��\D?�1�rOu�R먾
��<���V�H��hb��NT�lo�tn�0rѳ�E���a/�\7�=�8��e���_�.`�oG������ $8���y�%P�@dJ�*�P���V�Pn�W���$Wyh<w{�PƉ�?d\h5}���ٶ��)/h|�}2E��&O96�dM������M{�"e��`XUcl���V��J��}�LA�@�-�$�>�cj�}~I�[��2�6���ʫd?�9�<�M,��z�K�7,����V�O����?�j:#3vb��)V�7����U�w73�wJfbp�Ro,SEX���N#��lGQ��dnU����aH���k8*	�pa�`/�L]��]�ӼM+��z�{�l2Sw�G��^����4y��}_�N���-��:i���ď����ȵE��4��+M8���i�$Y�˙�4.��oX��<�<��B�7l6��"/;:�~���ͷ��%LBC�ߕN%)c����hݦ�`��Ʌ� �MY^��f°��,�"�b��ڡ�eq�/L���2���>�䦿F륀�2� ���޼�jP�i�7� 44[D볰�s��X��e��jΛ����s<�K�,�Wc�Q��r"�k���q���h�3�=̏��w�I9��7���R��i������O��c,oZ0�����/c��>�L�HL�]����m*�Dq>��>DbK��m=����H�f,)^u{�'$��ys�������$���<�dv!; ����-I��@*eФ�f�ڧ�{4f�χÜf��s&? ���v!��@��%џ����c8��΁�CchXy
�pY��	@M�zͳw��B���N�k&�LIPf�|gH>j}	NO�g�Nc�Ԑ{$�U�Q�f���dJӔ�f��r������ �]6?���iʵ�U�͜
�2c�1<��u����Gqt��Y�i0�{�J���I	��f�~����_u�_ѸX�u։����|& �\v��V��@�GN��`�^+REֵ��%�>�3���O����yFRH#*����\-    ]���X������Fy�w��V=DSSю��PJߗ 
�����X�"���,rDF��|a�+Q�h�b�o^|nswRb���V�h/+;O�&��q'�ڏo���{�׭��!�C����G友�𳺔6ou����,��U�l{�vKJ��k���J�1�G�����M���)2��w�s+!�p�Ц�i=j�<�"`�=�³&��x���ǫ7� ��U���o�x$�����S�[�UyGn��]�҉ ��YX�b��w��_��B��9���.d}�G��i���a��p�پq8�0�c6��N�Wֳ�k;����Fz��˻,�s}ÜOqHBZ�*��F~A����灐,�Gw�����YTS�EL8Դ�}U�t)�$��qc�o�[~�^�Р�Rm��B�k����X:�y~;�}j����{j�w�dn���5��K����x�d��I�l�╿�m���Qf/#L����"|�ڔ�;ة�i)ӭ�Ek�lbu�!�$4�k��H���
	i��x�.��2N���ִ�P�'M�f��ĸ�>_��">�C,�&��h����\q	mr�	gқ���5�s֘O���oj��Ϳ�}ki�SF<�!RJ"����X�T��4����F�ySf���+C��0�Q"�΋�����-��Z�>G��̈��H�;�@��SMH���[`[k����X��e�qץ*[<5^!i7L���cC$�@j�4j�_F�騠jmO�+�24#̳^X7�'�d?���]Ȉ�w4����5G�%qTrS|D���[ ��>��~x{o-V��mXn�����F���I�e'�3d��a?z4�e���)�/�W����;w�a@b�m�)�����m"B�%D�����F$��[�����d.�o/B�����W�����1+PDI\���h�֗�P����WvQ�~����o�|u^&�1$H��34.��A���&]�ⴸ���WB��0L���J�I�򸉆�+�<�@H:|��d�A��YN'v��U���s\�&�ct[�Dԝ�ʪ=5�����4����ĜRm�sF�M@�����0B�^�Q�6��u��ׁ�Z���BF����m���iCR<�KPV�Xjj~'�O��ɨw6��"���!�e�G���E�;D�FupL�����@�w�Rl�*4��M��aS�l3=�	$`�o��N��C�I��� p"�v�L�΃5#�� ��Gf�Q`a��å���w��>��م��i:����O%Ꮨݟ}~�z�q߄����in������gc�Q؋� �$��/�9���}&F�������d�,>g����
"N};%#G����/e�S^�Wٛ���Q��;��)�;�ma��������#?�3�t��>�Ӄo�sH�x���O6��L��M�Zn��K|�[��	���������4��]���w0�}.��ݴ�]4׫�>#O�:��u=�V������������cd�b	�[���:� �Mxc�������j�X�n%���h�����w8����)J�%��Cf� ԔUp�'��j���������{��K��+%���&�����?��/&����م�_��?E�{����!0�GB�s?�Ɣ��Yt|�	� ZƆ4]@������8��2�X>1;`m��ӕ�G������c��g��z��3ݑV�0 �_������s/���%f�ov�/�V�)Q����G(jk��_y`��x�vcT���a�Vc����3�'Q�~~�
�����f���N7�M �V}1�5�~Cら���&�5)A	W{��Z[�(ƚ�"��sR��(�t�oՓ�C�g!�w�]�ފ�0ш�A=h���%��٪������Mo�A;6�9�4��U�+`NX	�?Z��O%��C}�W��2�j���j,
}�B����_��V"`��|F��x�qw���:Q�e��$a���Ψ�4��]0?�T��y�i򯉔�?Џtn��֑� ��,a`T'E�L��_�G��čR3�{Mt��;8�6>�����-�l^������5Jљ���w՗Gu�ǂ	��'�
��ܬgF�^gz@�z�.v���QK8��S��I�nk.sZfٮ����s�ęxw� �rR9�ܹb�v}tE�<����������3�������F���l���Ӕ���M�KC��#k�Ys��Љ����d蠻�P�<� ��>�o�1R��Ya煳�`���@,�g��l_9���:T�IY~w�{d)�BE����D��)k���rT��-!���&���#�\���f���pB�Á�Տ:v4��_[" �q:�L��E���_%?,�ך]�Ԗ�y�"�����5�up+%q	�|Uk�)?#ckrC�dh�׭����
��^�q�J�a\���oB =MN��(�}��d[�͋ ��!nA�<��Z�㱧5A�DBо/t��ѽ�UlU�n�tƵ����{@:�:��TkT>v��Q��8�Ξ
zui�7=�O_�.�1����u���αOyv~T�p|a.?w4���W	!�����* 
��W�խ]���75�F��1˝�9 x��]�;^+v#d�֨����l����ec�]�K�+�R�d�S��7�^5P�kS�,ۙ:�_��D���}�&��6�3�3d�3�|��
-�L�*�m���C$��3j��q����G���N}���,�����#,ɤ�����>X���wܨ�|�R�y�> S�P��Yo����Q1��m��6 r��?�|���-�_�e��9��bݻ*������8Ee�K�I��7�#eC��i���x��~l���;�-Ǒ$]�����q�@��A�� ���-��"���3�#"{S;Ϊ��濹0S �Ù��禽e�����V�!� Չ��c���^H��4벜/(P�~ ���W��.�?�����0��>�����R����ҝ�t.��[/�#�s�U-�<����(
��R:��ߌ��k�����C��q�;�'����u�= �ַ�8G�x�} ��Ղ,BdwEFo�pYC��ǔ�F*�X�iR�D9�^��#0ң��g�=lnzO�Z��Dέ��cu�c±�?�D�}���bI�a���0��[#���z$n���ç�κ�A[A�t3��Z\��<t��-��՗^O��%H/�"J��d������aT	��(�`�W�3\üb�a�O3}�gm�I�2ى�n��o��}Y�m�����}�d>�Q|>����2j8̍�:U�z)�Ӭ[�6���d1vb`����O��Bf���?0�̿�~.3Q��-���RYCd��a+����g��o��&"X��k��xY��!�tG�jt����P4.gi�b�[��6�#&��*���s�~��Ͳ�m+&�/&	9)Yƕ�W��7S�}��;&��� +G��U�;��Ɲ�8C��q��[ϧ�u�Rϧ�c��K$-��s���0�����W����菷[�?/���A�s�w�6��#=�9�$i�hI{v&�됦%��+���Ҽ���CbU ����ô��is7kei����J��B�/�v��5�~V��)�+��T��2�T(�P�٭�<������[��������͵Hy8٬�EE�����nr,�5�����E
���Q���ZT�-U�|^z`���m!;�Ց��[;���t
����y�ڲ�j ����i��yNR�6�\�ez�����g�'v�-�S1�\r_�y�@�1r��F���]�v����mn5���BG�E=mL5S�*	O�}::->��`9���5�����E��=��X�����_���].t2pq�@�u�P�Ή9KH�~�9�ۘH�O%�� �6;11���E��s[K��?n <	(2�ؙ��JY�u������S���f�)��1DӘ���TeJ4?-ܓ�x���j���D^���n銭O"`�;���	݆�\5�����7�Ol    L��?j ���g�g0�tAé��}C-�wj��]x6���r���-y�;�~�D ��O���ɩ��N*�����,� I
B��D�+C���j_mr��M�ZeV-�q��5�S���݊��w��y�92,C(s� K��m?b��gE��A��fԢ�M��	�7S��6˲cU-���OlL�?`"Я^L~�}q{?z<��ɳm���X3�!��/� ?&"���xl���D�љ�/'�N�g+r�"j�񒵫�ԨsB�~mE;'x�1Tޡ� 'UJ3[��aܮ�J�љ��䡼h��˪�{�NS��v˽����-Mo�{�7,���=^*[u m3Qw[�6��:��	{�C�0������OlM�O�y�������Q�� ��^�Nih'��^B8�R�x-�s�!V��^MZ1�^`D)Si��e�n=3��leL�/����Y���w�������."3:wR��;���(w�-+I83�M�׽<�����{|R���Q2Vm%�3a��Z;�i5��Y��	�0�g��8@n����W��.���İ_���D���Ҩ���2*�=ˀpT8�-�les�PK��ڛ�?���Yj�)-�L�C�9OK��a����ܰ]Lv��ؿ����vΖ
�E2O�I��Fkā��uB��9A��1�Ňɷ�ߚ�K��ފ���a��D=l��5F�\�z
�z�Nŉ�=M�{T�s���`���Ϊ����I��5?�����n�����@���8��\~���k���L-�=�\��jR7�����:���<}'4���l5RUT#@.O�t�h����Շ�u�K5��y�`�w�eo�&m¼�
�}6�H��h��������g�E�>���;�Sӛ��(uy5��Xi�%s���*���P�� C�w���&�_�$��~��<��AC��wr��\U[P_E���b��ȟ+���J�"�W^Z�56����!�K(�ӂ0`Z*r���N��Zm�u�Q�
&�0�sV*��P�k�l�Z����2N���%9O��R�V(����v>�������"���HX�ky|G3_�՚���5Hd�����������$�k(���/Y9D^��b��2o��h�j��1N����1 A�h�ON{�%��e���2�f�r[pӝ)�ň�EC��{|��T/Yd��J��+Y�)=wS��Ȭj��lqpF��?���C�s�@1jޫxk�'1�y���`�����u+� F47�|��&���IoH�%]U/�
�G�0F�v��;�o�o��9��#��*2����oڠ57�R���2>S;��n|Q#ݕ�|x�n�	A�\�}��g��8�3+c\���@��UV��N���3�f�V�T�s�Jv����Ì�p��.��3;�������᥀iv�e���� `�Z씥/�sqB3{���m���������b�I����.�]���OlL�G���k�I|4��i��Qi��[����
ƣ.#Z]�8�ڔҦt��' �D�Iؒ���o���E�l��\�=S�k�<����Z9 ��A��^�B��u|��x0�Z�oqc����s~2��,E�o�R�r�WVJ\;H��7->����I�eZd�_����y�.�9e��*]k�|�`n������|U��G������O4>�],�����w=�X���ܿAȤ�ToS�,<�}�;�)G	�Q⫠����t0x8	�~`(�8;�q�h��rzL$��fY8SC�h5{bV�9d4���֙y���*��^mbf�:0"T�������5�G��ʕ�%U���+�L�"���~t�uE��`G��*"���]���%�)��%�߰�?O�����J!P�| o�Mu{�osi��\/RPm��$�R�D"�rR��L�utE��[Ð���_zP�V�����_P��.e\R:��H���O5b^CS7+�L��V���U�i��e;+{�*CIP)�T�P��X�11�J�R,�Pj�Dn�
�V�m�O$���7-J�?�ĩ�l�����%��kA���ڻ��<��q@��C�&�i8(~�u�r6����_�KI���i�7Ӧ =�\�������~Z��@S!G�syƸ�]�^h���B���ʉ��<�0k@�Cl^�ʄ{�#8 ���z���Q���3��
Z��]��y\ŷl�[�k��bl�y��ly��kc�/��q��K�_j�����F����?��OJE���t��^�ݚ����%*9F�`�P�R�8	Qa*vɣA &O!�y,���E��Q3B	l(lf�8�Ĩ?��P�@�8�ț�*�ˬ�V{�lǳ=5�ʯ�:7j��b] ��V��U��t�$:i/&�U�J�m7���������B����y���v.�W��Nk�K���?��Xn����q�]���2�YH0�!�����c�6��g ������l�7C�!��+�g�&�{�!���{�4�R�0�ꊳ�*,,T��J;�3��9�H�f���t���n�6�%�@�&R樯�k�s8�j��1M���;�Z��D��E���dFO8�˹��.�w4v}�y��uAԕ�k�p��K�����6$O ,+�X"��K1��,l���K���O4<uy=!Rع�ͩ2��P7��r��M��x��̳ҋ��>.W2G�
�d%]l���3�'䇲S�Ha��}����5�-�RT��#k�]e�'�8�������4��->�p��1Y�+|��Ju���k�\��E&���Q-:���9�[�ɗ�1���.l9X�ҳp��,�t^�U��&��X�~��Ȁ:"�֕EO,�����]Mm�H�
�E|�z�D��,-������d9�!L��{�o�����?5j��v!�[|8�ǭ�h��*����B7>�K0X���v\4��4���mA:r�����}�,��^	��X>[]�q��5��o�x̃�ΨӪ�q��&FN�e��#�{�_3-$��YrN�8��s!P[q68��|e��^����VN�9M�+����A��j�&Q� xg�qFTo��E_#���;��Ol�����oc1䫣�$��Q5/��
���y�*�(�l�h޼��R�F	�y�&���Į�9խ~7pd/Q�<9PBNC~7�q\�Y<ɝ��n���V����|�>Q�iN���R0��%��}w���n3y�*̝���ݏrRߠ�O�i��Y�bXg�}Sw��DA���N�rM �9|}���OlͿ� ����)�_��G+���x&Q���D�,�������)��X�6�`��M����U,S&(6�qu
��7Kb)��4wW�Sه�A�
�̋�XA�o�2o��7��"pņw#xw3����¶ŢuV�i);]�Q����$�qhm�=Z�z��2��u���#Я_���B�?^�_�ci��5=���	S�jN'tv�Q���e�cP�x1t$h=&�d�1��[X�>���yh��M.sS���<�2t�~�$؆}4.��iG���f�v0�9�G����>�f�P���'5����ݶ�����:Ny�p�pW,̵��k j�@�i.�
e����Ol�O6�����*�_�x>�p]��M=]Uo�^R�[
MJr��b����9Y�f6?���,|��R�b��{b]����k/|3ܻr��^`s�.��������8��%�,^S?��}ւA��q�<�SO�)`Xᄵd0��� V���4r�|�TU�OPv*��8]������N�f��'��.9C}w��_2����oz���ܤyBh�m�)~�<��^u��f=���@.�ڼ�9�̑h�Dn.����U���Ĉ��.�߉U��F��3�a���
��k�����q�<�aă��=-Ҽg�w�$�����|�D�ۃP1�A��}�.�Fۚ��S*xp=�	`��
�8fI�s�2��8H.�i�%��3�.R���F~ �+����p��ua�� ���K���L&2� JB��-��u�-0���\ݬ<1+ӹ� U�ئ�gTX�%TR�D�    �*��2�}��.�@� �����oa׭�6��Z�Q���*���XF��h�^s�������E>9�I7��qT����|gD�>�Rt���h|b�Xb��l�=@�/~�K`���Ĉ�;ĶS�Uy�0��C�|�G�L��U֟y	x�Z��6l����1G|��1����b�`���d�=v6⮲`�����dz�+w��Bt}��q�������X��J�	M�����������/'9����Av������jeV��!�����E��{h%�'��zV
˷,��q���������ڿ~M~�m	0i|���8SCٖ��W����ןt cP.�[�c�^ֶ����Vo���ۥ9���X�n+㪂i9LC�&�)�v����ICm
g�N�c"c�(��>C���L��b/�c���l�TO\�<P��m�t���w%����Ԛ��:��,@sv��8�����_ҸX����_�^�B�'ӗ�p��8������A�e�#���_K�{�\tk�`�rܙծĻ�0��9AS6Q"�ഡ��,VBGu%����[�-v#��ջ��OF�Df�r7Am��b�T�B��[zf�3�uD�X�.V4��=�I�KwB�3�0\�݄=��R�]"�ҥ��0F����h|b�FB�����P�7���я[�Q	���X�k#�����Z��~��Of��K�|#w�_cPKƶOҷӄ�����U�=��yA�E��|v�N�pR(�+��� x�����HP�˳�$Z4��p�rLS�K坬S�Z��V�ђ�1�Ԃ����ʛ4c(GG~�Y�0O���(y�G��&N�-��Ѹ`�?Os��y�/������-��B��S���Z[@��e1oJ����c���Ve�/�W|���zڏ��:�韈�O���� u~���d�k�]X�m��&?)Э���fz�G��<�ÉA��I�&�w9d]�X�m��?a{��5��4p�v ��$�_��-�l��Zn0�D-Y�&�-˿i|b�X"�-�?�/��WEM�.��g��up@��8h�M�a��<�sy�"A�7*�q�o�*��1�W\d��xP�9�V¦*\(wK
�'\�t�U%Tb��!�ʜϧ�67���i�5�@�����{Z����\Auc�
 �Λ�!qp{AԚ)):�3s�%fL���7�<�Y�D�������#M�����_��诎L&�s���Z��8(����� �x�ʋ�y��ڀg�0��G�?qL���zT�0� [� �s'�k��=���kߌ��4Y7N��7�:ML�<*���|�LMٺ�Z?Ad�����������{�$����pT�r<)�.�ׇ'*D6�k_j���_�����'��寲��N���Z;-M>��,���۠š{oY(G?��Ԣ�Ny���'q��Mz��F�\�������W
��ԩŽ����&���5�p�%/�e����?@'��+�cy�n���O%�8p��QٳҢ������6�y��$�)UH$��p<��>^�c_���n{K�k��2��eg�el��~����v���X���^�G��ԏ��?��=����f_��ޜj.���x�2"*_ݷ٣�7)�fC��M�;��cP��H�YJ��D=�H~w��ƻ#I9ߌ;����x-T��/�qW.�o�J�K8������Élf>A%Yqa�X'Nj���
s�s>w(4�S��5+��8�W�am��U�`��i�m�� P���O4>�]4�M~���ȯ��G���cP0H3�i��7_�Y�Dq~p	�x��	�SD[�����"}���E���m/\sH��"f0���;U�y3\�gD�!@��M�k�5���=��,��f`�2Y���%Π�),h�TU�������n�5����B�'? ���Im�9�qF������'��%�s�ı�Ő���/W����4N���� �P1��c��y�E���x�*�/=v����˼O�j�j��}y;݆z�>V�Ydsԧ�x�/	z�1l����\ˡ}�	��|�1l+el�ؤv��E%���~�kve��o��9b�ճ��5�X�[�g�q��Mj�|��C��W_Ȩ?!�����X]�Ί���M��+�z�1P�NL��7�LmA�z�V��Qy�� ��}.#�3LCA��B�\��}n�ǀ�s3�qZw�YO�'p@<�z�ը��'�b���3~.�q(��.!t���4=���d�����ֳ�g�8�̀�Rb�����ۅ��R����5
��W�E��zx��x�עV�p�,��DZI���&�]Y���H�o��8�d�l]���������G���p8����D7�{Bղq Ƹ��_�GG�^�B	D��Y 9�إor���-������F�ye��R�X�Scl!������׼���Ol��(����س�}���^k�٨'w���O�杺-l�iU=�a	?^�޵g��2@��R�F�q��g"6��}��0�Ks�ͫݫ��QR}�XY_$�WY�C����m����(���/(������"�V�h1�h>Lw����8��B�<�i�B�����T#��h��(K��;�n_'~?���v����=���§}�2���O���b�JǺ�i������Gq��9�S�OV�v�$N2�u��{��q�A3��_�*���.2��p��mdc�x���ZA���f�/�J_ڛٰLL��#���m�ѐ��ey^!6�}d>R���=b�+gΖ�a'	�i��_������|��H��j1°5�#ɯ"{���_<]y��B�5~��U�]سW:A���䬪�Kzn��9s��{�0?��g��
�}5_��r����/d�I�� �:r
J���M{����q$�yk��0�T2j�]_��Hy�.�� �y�X��og��8:��e$�֫+��2�a߮����v������Q�/#���������n@�B�y� �X oɔ�G��R>���&�;�J(��3i�|�q#�؏�v0�5R��o�>O���@4.\���7�)��R`�=��2�Y�m[�@�)h�0)�y�kT��N�?�R	b
�W������	ߌNM��4�H��3����Xv��_B{*A�u>��OlK�W��:�OQ�G�����Ͽ�+Ͼ�@t����߄V"�x���a,2��k���8=���gD��F^��x�(����2&��3��L�����%��軌<�Js�QK=���7���ht�6�y�/�7��:�/A��w�1X�]s�C�'O��4)���1p{訏)7�!��MW$��\���nRJ}U��4.�������s@���U7��"\dO,��h�����C������R��7�6+\�
���M�x"�Lc��F��t�m���(�*�Z��z��K{�h<qS$Ϲ7h	�}["����%E,W�y]��_��i��u1`��h{���S���ۆa<B�V��`�0�s�g��	�&0�c�}�?���v�$�+�_�K����5�E�5k�)�ً�G'����g�#U�y+)�e�Js�$�V� ���*�o/R�����3/����U@T�i�*�G_C��?��HWB|*�=790�#Yl�2��wAd�CfW��7�L�|]����?�������+n��v��·`^�B��aE���P���c�O4>�]0��&�Q��ӳ-��\zc��`o��ě�G�Q���I�^~��3��0>l�"���<@S�����=�}�^�}e� ����k����a�ej�47A�F"���QR(���c�/����Џ{c�UB�\��Lm�*^�rB3���Z�˕�\��y�9l����s/�E&n���֕B��O0��K��v�����WWx��������L��o�Sl[�'Y�1�:}3���Ju8v(TGv[��������&
�~��l��-�~u܋;f[9�w�򳔝֯Ý���a��D�Ƒh�G!H��y�z
Qm:j�,'b����0��߀P�zU���g    ��ru<��?w��H�O��F�i���\����I����~��t��C��J�N8�l���h��K�ҳ5�Ӱ���2��� 	H�;�8"[xQ� ���Ɵ����F*^�G�靷ڱ��Z�
�h�����9�3~���[�A-�$�4ħ�l����٩_'�C�eyI1�/��#�L�zw%Ά�0���hz�9_���Z��?�D��1?l��������"	�r�H�X���Y����E Gw�=(!�6:ŵbW"z���]�V���洔�][Pr��p�����-�ة�b<-��[�����;������Ib��Z;��F|�P��j1DXvE���Q�pw�X��ҰƑE̻G�KPR���U�V��5����ۅ�V7?j}tB���C?n����<���WF�����]��q��u|oŃM�a����ރ=QCv۴hmE�x)�Ky�W������1>:���	��p�)�QrrSn������.`���xF_%�#QfT#���wy�yF��v�5E��W�75�A��{���a2������@��A�m��',�܇��י~��i�h\4���&�es���-��}v�;�M11�B��xҌ˹\?g�Du�0��G�B�\��-��7����� �޼<�:Y��DE�=`|�nռ���	޶=/�dFnAd$�����(HV�+�O��Y/��"���C�����y�����t�,8��h���m��ux�'4��h"�ϋ�O��&�����<��ן�V�j��Y]�+����n/�T��6��^��9�p,���TB�'%��@�^�H�K��n����|��嘃�Lb�U�R��t0k�m��w���T����4x"��e�}~.o��o�jj���]�2�9�,I�@��;���Q�,��4v�����q`�P��x3��G��_��?���v�ľYh>F��l1�t+X�����x�g-i��&�to����
�(흌��uwv{Y�(p��c]�6Z&�j�5��77�Ե���<�k�)çz�7"f��ei0#���N��X����C��z$�nC8�*�9U��ſe}>�[�<&��3wdT�Ցe?˻���*�m��"}���L����_�H>�S�H��ˏ��_�Iy��v�=��VPxA�t��Q�Q�"�fM읃�q1o�A��{\�~E�H��/��U\�:�� v�6�>;���M�E�e��0Ѻr��Ѕ[9̒�5PE�R��x�`���f_&�o��HXkFa�ܰ�Þ-���e�!��.Q��&��W�1\�lLh��i�`�og��4>�],��f9��$�Q�����o�C.�G��#u
j�Oj_ʭaF�W=�Zchb��E��}��I�A*m��g��0g�Ԗ�v�~����U2ie�o���`�M:��+|	�6�nXK��[٥�2��˓}(��Q���1R9&�߽��������9��W4�u�"X�n���	Rȡ�%X-))o�3a���I��&�g�C����Y]=U�lf�vj/n"Á�v`��b�V<7���F�k���M��;�"�1�0������d3���q���6��Vi��Cn�9�P�YD�`(��'1�Q2d�I�ܜ�������x�h�x�ex�)1�uB@w�L���e���fPL#M75c�����(nҍ�X@��,�����/`�_�	�M]��"�5�E���^n����� INQ��u{"��:u%ef�E�N*,B)�v��Lx6Gf��eh����Xw>�?H+jD��8(oT�l�p�D	;`h����P g�;���(k,"�9�)��U�I�r��	(	Eg.��3�<���y��`3��	�?�	�d�`��y%�_��zGz����5PTd�u�?�'�t`Ӧ\����.�\�͚vY��^N��+���p[A��r������)Ty>���ڷ�-2H��hq}W�.
D��� K�+�����a����60S*~���"�����hH�`��߁����H��(10�i��kư������Ol��!��0?.�}���B�#������p�w�B y��Ax�/���^��s�_� �����V��ʤ��~�����AYi��Ud?��e�նu  8$�t�[ף:2�O`�&��=q�ی�'R�e�B�	��/�3ty����!�8	�>=�2�&�DϺa����&=�&cM�a�c�o�`�E������R��P꣜ ��J���?��u�ݼ� �>�+_���'�r�u�U#�|�w�n�5_Clش�T`�tfݹ���s3i�v����sP^,ƶ�ǀ)c���ɷbSf��.�H"������⇯*>i�Ɔ�	��N<�*�m�Ok{�	�#��\7@�ޕ�ZR}৺$h ��CE[;�S�;Ϳ�q��=���UT�[Χ��ayw�����`��i A���%�+9E����	q��4�����������:e��j>/%V~�9�2h\bf�Þ���6����P�U:8����y50?�x�Wd �9NP��>9�����[C�>
}!K���Q3��-���w�MW|�v<^g�9�;I��<�_4>�]0O�~�	�xW�u%�.�Dy&�>��&i�"��oK4U� � 2����@���nY�s�?o���rmpw�P� b`�=},_Ꙕ� �L����_�.\�6���m.>&;f/�Y�3_dq�s�Ԡ������h�)k�SY�t�T@��&;ʓ����p��7|(>n��Z�8z�__����'���՜���ړ_��P}�e�4w}n��\7tKJCw|'��c��	H�*������N�M�ų�;B.�����q��a?7�A��B{��*c�x���#W���]`H�+'А��6��ê~�����q�މ� #��)s�9�i�H�t�����9�Z��@ȍ{G�Hu++�N�H�2^��|g_��L���b�#�K�~T����a����J�j֩�I�A䕎���N�L3"b\����o��c���D7�/5%���f�(���W��L\�[Fw�������Ms�7�HbETǤ���+:�	�ou�4.$#G�5��n���rRKn��y��V�1}���|=2��I�SR�[::����le�������4>�],{FS���2��3����k�)���;d��haR�����+#���ʗ�&��QʢwY����Yp���a8�TlY��\�á"Kd�c5{)Oٖ���h˻IS�*�
��]a��/R�h��j�xu!)�M!QQ=j4�̊^2	�c��8u޺��%�2�M�ݱJ���ÔN�2ů#�O4>�],�/�e|��~<�������yi�Q;&��H�"����c�� �ـ�*���g1e幡�y����@=�?9*��YL�c�(Xݐ�H�ЫM0�_�	�#!�dM�Nc�y�p`KNrn����4���Q�}�2y��#\�qBF���C{�pGlH��(��׼���Ol/�A��p��=<��	55d�>�:  ��2��5��S��e7}���uXm�4av���c���oϱ�u�"N���<;�Zܖ�x���\M��3��p,M�+��H�%�d�9z�fwS�wA9D'�<a���~H/��ޫyp�ѥ��Oɞ�馺�3�f֓�<��1���2|7��E���B���KtB������rv0@��]ڥ�T���C�!z�"�$����3�ԛam�Z���lG�[��Ѡ:�ǻ�lHu���o��$�!V?�cC3�i��Ƅ5Z�X�2�]� 8�W�僀��� ͭ��ύ؆x��K��|@�7�K��{5{��8�j���n�7�`������$����O4>���?y[��eq��z
�x����!n���o� �����R�(��Ÿ��y{���2bﴷzx��̫ؔ��L_�[�'��1������2�݆{�Mk��7�����S�(���ߥОH!�خ�=Ȝ�'#}�@�:�=i���h������1�����"$���D]I0�;�����S�Yd~����	�`#�����X�*    ����/�C��|
`Z)3*�(�r�	����35��2���P���E��w�TF[�g�
)����̔����$s��F�{����%�?�O�ޖ�5=
W� �E󂥪v0+xR���������۞Z�e�'[�a�y|��ɛ8xʛf!)�ήʀ�G��X�M���򗆗ȕ|�?�D?��}>˗���"�CFjC)������fv2w���M�])p�;F�O�r_�;�/���w��]��Y�ǻxydh ��A�k_��R��ѽW[mGR��.���_U��`ѕ�0R�iV#�b%爄61��Ӏºȵ��]�P�3$i��"���d��4�j�.j_��O4>�],џv�a��?=w�<i�/�����O�j��3�8����i|k,� 7�]=_�x#d,���@|k�{�b,�8oq��)����ػt& �	�@s|
=R�s�Ǡ�+$���%S0K����=��G�6ܵtgw�����#@��%��?�Fϧ��tf1���ެ�̔'匣%�������5������8��}�
��Q��Ӵ/�nT��,�ׄ����g����cx �RBm��Y��>~�|���b����#��	-�f蝐���}�E�:f�G��L��Ě��{k�pf-�֝�/w+O[-5�Z�g-�d�V
 ʫ7�`�b2 W����ŷ�-x�w�j���=3#������j/4Ӑ�"ӌ�w��OO��^��jed��:O��L`���h��O��0Xv�p�i�"���T��{��h|a�X�R�������ž���j��*�$R��]�d�q�:��Z|������+��i���0bl��y֊��k%�V`-$��+�b탶��f��<|�\	���dӓ4�ԭ�%�ֻ��
o|
�$/�O3Թ$D��\o��r�&�h�T����Q�2u�+�i>Q~M\�l2���^��g��h|a�`�w�o[|��s%�ʮ��\+�1U,����a=z��^؀KcZ&��R�\
1���14�_1[�c�W�m�B��hſ�t�x�2�0k�ج$�P+8�,i@>;���R�ʪ�5�[/-j�P<M���3�E+O.N���0k#E�b�]8�Jͥ@7�������
���%�������Τ�+x����To�qp��y�wN0	Ҹ�sw�J�bƔ�y���?���)�,��ƫ	f��Yh]?���W�ӏ�̆VI ��;�b���U�����a��U�/��>:�q�3�ƪ�DWt�?�Mcm�·WPH}�r;�Q�� ��[<G>��q��4����#��L{�n�c�S;?�.���dC/�$�_�ſ+��·�M�ǝ�X�@���.�Ugd&5�p�b�!���>��6��N��1�"ߓ�H`��t��<��F�9Z:P���	Ju-�z�;fVd%*#7^�>��ɮ,���9���$1#ֻ�i���V`�Sf������0o����^p?z)hJ�ߦ���cl�g��.�D��E�����+���ǿ$���V$xx���~P�G��k]�E��L�J��&j<����.���zÝ
 A.mv�&��"؍p!�7���$�o ���;��<�=�E�����.I  w2g��]\�*�ߓ���ɵ0\g�,4�)�z��+�[���L��`*�+5͏�z?"#>�X�d�;����Q@	&/9���$�mɕ`�a>8��|����]�Z�I�=�:5j_놚
��/g2yh��ڮ54��w=�2��lq	����r ��n�Lo9ޜο�vj��u�����	�}�(��GV1�Cx)fre�i�z��v�m�o��L{m=lf���2�~$ɾ�HZ�Xf��#<�xj�ͷɉ"�s�����d�X�?���
s�ί��D�7A��n�.�� <��'0b�nf�z
mڎ�<Q��3�9�����mJe�X~�hϑ�5e�d%��>�ok�)��A��_�xw�y�(H�ѣ�:�G�{�"҉�T�v�D�(R��?�U]4�� �5t�q�'�֏�Lm� �)Ht�����PTL�2�������v������ �/����_¬dc��)˘� ��G�i�!�.�ܕ���J.���kS���Me_��:>�IP��\��'M�n��<39��=^��c��!J+\je��Kd��1��y�;���ęSmP�;�#��ӄ+���O�(p�?��7��~+RwɅ����"�۴����������b�i|a�`��=6�+���ߥ?]�s�C��������%m��K��WRS��$���.Wy����D��N\�t��� ,�'�Br��W֎��jE�$hS�S�YF������O�.p����
ه�o��^@�ʮ	��Y��o�])�}�C�`8�$t\*�i&��gQv6<�&����ڰ[�0ʕ8DG��Ok�h|a�h�z��͏��_�eH�2�Huma���G��!f~��̠�������+�!p���\My�n�j����u�3�Q��ӹ�Po�Y��>���T�hX(�j,���M1�?S\'����"�厳
��7������d�C@o���z�;��)ǐ��9����(�ۻ�#~�f'�����/lM�7�&�q���~�A61{tĠΒ6�os��+�Jk�����J�y�f$�C�L�(��0Z 5�U�d� �<� *0���=����3C��>뺹��|�/Se��s�n����V[��W��$ ˻��YP[!�����,=H�Ծ1�L��mdu��g�kh��`&���M|ӡ/��x�>|���bI�����]��%,2��5B�K��B��*�%[��8l�9��QK���D1&Y�p����� ��!�Q���h�[�v��r�����-��t�#���<0�7ש4|`7"�(t��XӸdnN���hn9�
�]�6PZRd�[����A�]tO3n�7�r]T�Z�v��h
t�C��E��h��&,���Kj=�D������37�՛xKd7�9.��w>G	A ��m��Cw�X^��1`ό���cfe	��[A��$UsA᫧�+�~{�n�O�Y�����O=�i-��@��)����-
�G�-'�KQ�؇Q{���σs3æ�[��V���[���0~�������=��h6+/L���z���
ȶ�!a���8�����	��2۩
Z�ץ�).�7�F�t `�ӼyB�Ä���!-Γ{<hv��#� �z���NGFKq�/��Ŗ����U^xgyc��M�萞�n~��ݧG!�Nd�L�bᎏ��N�V.8�]���<�7#�'���4�r(�q���5�D��{��X�;�}O3�*x���܉�f\�^Ѽz�c�����q���,/����-i��+���m�pón1��+�fжLG�	��t:	�*��1�˔�t��{�����~���^���jBs���{컗%v����� )w���Z~�������(�;�0��Ń��)&�^�x"�L���[�nw�P"$��|�$�'@o8�c��$4��&l; �R:E �L	w�����2��iC���$�ȓ��V���L�;&g$t�λ X/"&���}!�0m�Ǩ'�l��w��<z��
�=��|^�z`ΐ������Ie�ٺi�z������h|a�h�wF��D��n�t�ﴳJ��Xm�4���4�:�r?�ڋ9Gv�I��&�)�w����]��>F�}�Q�/�Ph
�D�Sk���U�	�b�>m�5F[!�mA�x��'�/��E�
n[�}ڴ4��ħ}뾈x��Z����31��K�{6�"����\���Q��~��>���v�����[d����rxx����38
o�OŹ���䫠r7���s�}�12؊��
)�� iD����P�!��O��pr9ߌ��x�d�AџnѼ7��0�.������ղ��Q�дg`��!,%н���$�Z��CV��حQv�*���P7}�oMU�X��+�[FG�0���>���v�DR��G����	_G��	    si��򛟼<�
_��!E�( �����ZK�b;"��'+>L����Z/1:�������@�9���k�����Gi�I�)����ڎ��h%�5�&��[p"v��<�ڑ
jO?��T�;���𷶝�o�.���(�hG��5�DU�f����Ɵi|a�X����S%O��s񡥾��X���+2:�^0$u��G㄄�+y�O�Y=?��(�Rs����5�F�0bҤcIz{pgX��02(���Tࣁ�;{a\��'s��+хD@{T
�J���6S�U�[���:����Y(\�O!�Z_�
�J�%E�:	#N6�@�����cq^b�.\&ŏ4�������v���W]�?���P.'�����m�%�%{+	{�5�}.�V,H1���7j��{��Y��ua�L�Sƣ��ćA�=�:4E�~�|* *������`��lkq��]_�M�Vz`��IB%8�!A�@�W�VaJ1��$c_�|w=��D\]vA��L^���N>�����8�1(i���G�?иh�&"��u�����2�V% w��غ�$�\E�zI9$X�/�;C�;�I᪺G��5ׂ�
*�9�~�5�Ϣ��v,��i���ͬYeDVs
��g�i�A��G���O�8��K��L�B�poBy�D^&yg؞���_�lr>���1�1B�5���=��K��G��)�I���'�/l�?"�����3��Oψ?���Z<�m�ۿ>�ǿ�����+���+������W��+�χ�_}#��=�mv���$@~ʗW��2��%�9l����N��t���]�V�;�Ν�Ĭ�uC�����ץh����>�YxV�K���/��Ԛ+�A	Ui�mL����3h�0i�{�7��p�15n�K�|Y��$�0,B�K���]����oZf~�/l��ic�?>/���8��%������,�hg��#�g78ᚡ�3�@��Q@�l�/9���tI^|��(������f�+��L�����ȀX�SEhW�}e�2�ǭu
�d%�>�@�2"��A��4����6RpS��?���F��NL��Ҩ��N%�e\�K��?��m������F��z?Ӹ`¿��qa��\\�㷸l��J��h��N�-מ6+z���'D0BzRΣR��FW���E��fL.cS^��"�p4fH��в)j�O?��[:��P���G]��5�|5���ް�Ø�W/ԛ��Y}�Zq76��E؆<��|��̝F��fV�\�+H���+�(��='C�ɑu�`����C���jF>n���?�_?K7���0���N�$gU׌['�]b�(Fb�S|��(��fP�q��CH�8�Z@%�Uޫ�y��a}T�	���yw?p.I�	�?���=V$_�����
G:�I�a��4�Ð�V�oKs@��2;ʀ�E�����}1��.D����*��迌���]���� �0�_�G���}A�ɚxiS��L�	ϐy�D$F��	R&>(a\0�z3F����x�|�����4��(�n�0�����]�' ��V��i���>�k�S��
�O9���W���"�Or�#�E U�D�}"�|�H9q��H@���R��W`�+�B�~���r�a�À �／���O�e��zB�QN��˳�Gg�o��0��5|���}�icL�1���$7��Gĳ�D��$�q���K؏X����r�Z�*�R�F��'�1�RЫB^��}D#UQe���?i�IJ4��_�Jn�6f��@�
��D�|��֡�2�X�SKV-�璿�0�\N����7w,���u��So}2��H�O_�.��*�/i����jw���;�uM�=�u8>:M��C��j����V@����W��d�B'�r}pl;$S<��6GP�B� &SE���C��e��xM"���.����!��<�vHX� ��r���Y�ւ�����͝�0'oh�;���, ʵG@} ������
�m{Q��L��$�0W�+�O4��]4��-3�?�/g��̏���^��!~i�"���n �m
fȚ�LgXȍ�	>�f<�/�C7��^�{J��W-�>�)�O�|�5�L��e�a�tKn9��e4�O��{�fn,��9�@o��$�Y���](=Vѧ}ܓ3s��Z���&�`�����gi~@�[t�k��f{�u,@��`��8
�����m��vM�#����Kء��n�6���nI���<�*l0�{���I����
��%��X*֫`������G�����4/�U�_������;��u��82���[���3^
QV![���)W��A� -Ʒ�\�G8�CgBX���L�(q�_��������7i�7�m��f|�������WG��ׅ�c��ڭ�V����o�ǒ6��
����U���)����;�)��I���[⃇��U[q[��bE�Mp�N�klaEWW���s�n��t���ơ��)��6�{�0�m:�ԥ�,1�Y]��Y�$PpӤ��:AVOZH�����os�Ȥl��H�\u�_1�l'��f�����q��M��|�c��rT@�H�PU9
�|�!�3�|{s��S,����}?��}��\��֓z??�G紩���YZMקp�Cے�p�W"鈥Ly����^���R�����!6,v����	�52������/�䶂�xb}�g&�\�@�/kr�c�����hn%�p�z!����'Q��o�����7��M��#�����أ�3��/��.�dNQM��v1mL~m�K�5 S��t�8��=jl��ꭲ��X®,���IUr��-�����6��8w<�l�c����`����3�X�ݿ��k+zu/��p^i���qӧ��g�F<5x���?���ݝ-Ycn��	J.����3��ͽ?T�����q�柡Χ��<�]��a�v.V��&S��M����3���"�[��˒ETj�����M���Y���y�M3��Vq}�p�F�,Hʍ�"#qp̈́w�ߺ�� ��ݬO|�G�Ǻ2�\d-�����|�D�n�@x�fud�D���0{�� OgG��e���Q�"���E��MfAP?��?i|a�h�zB����P���#��8F:{���y�b3oa7Dj���u��V8�*vZ���hXe���`=�� �ɾy��^t�XG\r �B>�B��^Gפ�`�%ĥ�f�ߘM�3�!1�F!�ig�F�|
�^I[�8vۥK���R�b�h7p1�2o��0 �~'���U��Y�s�s�gp�?�?i|a�h���
#���(�C�vf�QG?��	�w*�;�{w1ȾX������*��r����kw/:����[�-�5yC���l;��'3WNu>Η�wL���YYtV�u�6���u����J�
uv�/���=�P�^����w�M3�zrQːߊѥʔ��g.�BK�"���Q�����0�_����v���kք?��ǞL}���Y����T�$�t�'�t�� ����f3Xy�G9�*� �U�������Fߚ�twߗb�v�g�u�����o:a=�jv��;Y�{}RNa6bCtw۹��5SMK4!UmZ��2	���T������ݏi�=���ޖԛ�u!§/A�?=�k6Ȁ��8�O���h|a�h������Gٺ�I6����w61o���ڏ� ��ߋj?AaI����LR�3�$+'A���g���1��r�����7F��Z�r?;C+�c<`Fö�6�lUSIE=��X��l=�4�<�6�4;���qj/�����'�R�w�ĭqX�L�� ߪ�8�^��ؿ���E��c�_�F�i�N�[�%���û2^���5S?���$�p��9�o���C��'dM�}涥�����-��k��
o�n���406'̥�����8Ji7�Gn�V���d�c���3ZF�Յ�a�B��T�>T�W��^�4̡'�+�"��%��2��V�L�m��˻���i�9q;�<�����'_�.����Կ�I    V�*G/ P,ўyo�{N���P��&��e�Ty-��sL�n��s+߆���Ŋ�x��R��W��DVҠW�W��۪��Wm�H��C��d9�N���f�Jz���a)ŋ��
�vEr���=�H�ZL�s�D6d�vg(�����Myۂ��L���_�.��^���&����r/��Rn5���2�5����s��C�/x�{9 �����}���(�����M%��0�i*�Vd��S*T�%���)Z?�kf��G���1J���7`3ec�;=�jbuD��.؋ A$,\*�{̏l�߼8n�Z3�w�e'6����2D���o|�����]4�b����p��e����h6t��I:�hx[��Eޡ�h�/O֛�r"�)f���I1L<���Ң���� �a0=�o$:��0�~��Q�����}���%k����?��h>E���U��<��X+`�$�P��ג��u4����a�T$>n"������|�/lǉ�ćt)����כ��Pf6�p�=��y�tK8��d�p��e���&��^�4�P���zj�������^��:a�%�{���[0a���+τ{軅#�6�1<�*�5��9��&���cȖ�϶�������(��߉��[)��r�W�J ���Ȥ�ջ�Q�k�jD�q4�I��E��KO_�D���@bP�(������.�����>�!�\"��ᬞ'3��5^̅{��jAc� �ҽ�JK�$�9{�ằ:�<�5L0P_�Aj�d���R��eg� 4U��F���C.!��^qi��Љ.����X	nT�;����v	�|g���Q�,�\�w�K56pR���^�|�����k��O����g�]pXl±I�rBp��E�����i��� "����@� ��5�� �2�'��Q����S���∉�}�AN���&^ ֌z�C;�RշI:>�Eo	�lt�]�� '04J��ٲ�]zt�l��7�%]g"{' �ESb`Q��Oo���"�k��GH��Gя�����p�
���:}��$҅HE���M(��n�G5� 맞ƜڂwV*�|���I��^�.�r/��ܓ0�=��V�����C-/��cr].,C�����X�x�t-����h���B�Q�p��i���A�y�*�����n*��+����6�A��{s
!���W��ö�'_�.���o��[M��@�Q"�����/�E�I�"��܇��r�=�r-����=��)���i�'Q�=o�n�03'<_w�f ����B�Ԫ��Xub]�F0^����~$��&��y--PZ2��Pd�3N_�mrUc�z����bu:{��8�xj��O`�G�r�^*�A:�Ӱ���|�*�����
�Y�'�y��?��i\4�����|�}���M�~�y�@�0č��5p���M��GO�O��5����M�#K`>c�ؓv.*
�B�����)������y�|zyEH�!�nc�K4��!�&0��7�8^�18�A�l�[CZ��3�@Ol��g��.ݻ
ϑ�;$�������"�|MX%���70��&��4.��te�ؠ�tr�����N�+p�.܅�sCkv�l�aT?a!��2��	|�y71ꂓ�F�Y���S'�'Z&����z�����Y+Ӄ'P�_#������C<ϓ� ��\�B��j��t8�5Q���S3��!���q`�A(��(��T��S�{���<ʧ%#�1]�;����i���}2�g_�.���F�Z�n�� ~��V� ˗����P�hD����G�
H�g�q�x�r:�����,n��pI+G���	g�\�]j��5�p+��#�mO#X����R�����(f���L���} %r�K�I�ĩ����{~�XM�i�]�^�����0C��Ll��*�N��
�#Ul��4�&t��%�F���mow\�����.�(Rj�$;;�z0��Mj���-ͱ˵p��Rg��&-m=���^!�d�m�}wJ��m@H�e�\+ްJ/��nH��;$=u�DL���ea��1	�v@�8G�Wz9�	!�L<1��I��o?�U�Y�Mc�ҕ�@�o�è�β�)�:M��dUZ���i|a�h��^���׽|��m��Y�_@�m�?D��G�%5�'�h'5�����әr�V1{5�Q[4��ͶŘ�&�n�u4��x(:�)ʆ���	�U�K[AV�^̎t��g����P�7I�e
��8��Ǌ�j ��f'M~���`�dъ�};�P�Lc��J4�1��d$c���D�9gLZ���`c)1�@-�d�x���.�O����㟚�C�Y@>�O�JUwG��5���д��p�(̄�]��@hv�)TN��J1Ϙ��}֯�Ń����9J�qӲ��T�s�2g5^1h��b�t������n�ϯ�Nc]G2Z_=y��ɂx
�J~���������HH�ܢ��3�vw��/����W����\�7~�E��׊� �]�?���v����*��L��>�|����M���]�&S�Z*�����[r�23���K�4Y��Ͻ��Ǆ۸�W�x-1�.�h[�rV
�=����A�e[U��;SA P�-m�A20[��ځgui̕����~.D�zBBf�ncTr�Cc&}��g&�h�U�����`�W����;��c�\-���~������_�]}t��b��I���C�H�r��RI��H!wΊ	��*c�a�0U<3���OZ�=s�G�Q���'M���V�Lq���/1���ӂG�~X
F�P�Ԫ�&����55ފ�e���s6R�t�ty�ћk�	��]:tK�CPE� �s�ӧ�o۹�Ш �F��*�~��D������ɯ�������$^�
n�E��5���<M�0�\=�GL��6.�V�8e�ަg�d�:�(��\�4ҁ<eZ���f�@��C�o�d�F��nz8���;3Gc�M�Y.g`��W}�ī9vz���gI��A�Vۂ8Q���2�O������M�SkQ	D^�l�~���	�~}���b���/��
����6����K��Q�� ���T��A�ސ���׼t�Ӷ�6t:!�}+'G]����t6S�]�w�Tc�l\{����l�JRa�n	^��k��W��i6��~�]��zW�	��������4��4��ͬA�P�
a�F�Y�����x�R�*#��}?���a?�O4��],�S~���ܭ�+t���o��+���Ԋ��<�Mo�G^�Q��jz�)F�zfk�R�܁�@^�ic�oB�GmU��;��ٝ(y�w�����f2�'Pm@�4��W|�t)mJC������*�@$�2��x���A�3^���FI�~5�3�O	�g�����i((��):پ�����_�.d���K�З���:�����e�C�	>v<�at���'Z��e�>��)�)q�Eы�Eȗ �5����W�%]_����,w�.V�IVD�EvЪL<����ay{j�էړ�R�;\�t�ۄc�Q�J��`�,m�^zFَv1����}�kkkyy�����o��e�{}��p`��?
��unb	Ab˯�'�h\4��w��M�E^<�����m_�{��"iJn��0�k���ǲ��;�ml3�#H��L1��-ϐJL_��oI�5b�ӣ���� >^�&8����ֳr�3���A#[c���AS������`H�u��^��e�'/��q@�q�~H����Oo���BF��|w���2� �Z��e�k�z�0�0ooӉ�$�T	��{1�����2�(Vd͇<��bR ���g�Yhz�.�\ؑhG3<�Y�Y���LX�꽏�(��B��Nn߀���UԽ���6��� ?��|��ؖ��-r��g� DQv`	�l������������C�\���F�G��}�+�I	!>�^�[���۳p[_��g�j�x��w��.��[��;FѵX���_NC�I�1M^U�zʐ��& 6��s�]    ���N�'�SIeqF*���>�	�g!*A�j@��[qvA�u�v�8^�
�A�.8`�Sُ�Krk��	�j�����[��~ �ُ���t|��07��a��v��<.|���S��`�%�;jS
�V�:c	�8p{��ʇ_�Ko�!�K���Y������y�0�8���J���X��^�1��M�@X�'q:��=���Sy�Cx4�����K�����{_��,bgԪ����뭿�]�����c|r��э��3h�8��3��^X�H�3��4��o�����$T�)�����˃���l�0����{��ݹ����F)U�|ݚeN���l�����S$I�����l�Af n���/�Iڭ�N��A[�t�6����`��x�,w9�|�tŉg���)�|ht��S��+U�&�h|a�h��s�����|�c�s�?l��!>����ſ�We%�I��x����K9���:$HH��ņ~�����a���Jy�ҭ�����s��ު��jK�������L�� ak���l�&�W窷��V�����(�������8�:O���8֤�0�n��Qb�������9�V��V�V�cz�쨖�>*����̏��??m}����G6�Zcq�� Zlq[|��^خln� �|�e9	a *�
W={=�rj'b�$X�Mφ%�O�~�����e���Q�K>��Wt0ʖ�V/;e�q�y���nQ]��$εE
8�n8�Ѷ�Y�b��X�G��ξ� ;�ez�S�({٘"W����9
�}�WfS��5X��G�������_abx�Wü.���I� \"��ǖ^�V�z��f ʔ�+Kd����[6O���$�^��!}#�Ǭ܅��2��"J���P�OP��f���ʈY��r����@+�T���!rH�+���C�!)��SF,=��tעi�Jn`}�z�*+w�����
��
���X��/lL��0q�W)}�yB���%-����ѥ˃�b~�	t�	�� x�-
Wۋ-�j8�N�H�*�d=�]ET.�p���8����kjt�	��BhsS�!�LY�,X曽Ɔk����.� A�y�L�2*n�v����ܭ�ƾٙ�p[q�Y�كwnsY�5٦0:��������=��?Ѹ`�z ����_>O|��oz����=��2dm'H�� ^
,p�ɱ$Z��w���4 V�����RX��3�����3�+>{�����Ւ�[P���<��h%�m!�E�',LXgGR%��ɗu0'�;��4˳��z��'�n!K���F����5�!��|{n�jaP�{�,�ldx�O����4��]49�����/�b�wI
�g8�X�%��x�- z7{d|��r��y���H�V6G
��ժOD����NI]��T�'f�����������;�C+��yĕRHP�/9i�^�WpYN�%o��@���	B/�|m$Yfh����� ��k3�������%H��0S�M^�]����q�'�/l̟ü���wi�w�ӑ���{v�'�%����%#�T�8�!j���Ƭ38������x��3hޙ�}5*+�ފ	 ����%\�����q ��qzΊuv�<,=��L�n޷�0�Un���P���7����Q�t�(d0��60�U�'�m�5�k��ۛQ�G��[a�����h��Q^�k������!�ҸAγc�Ӌ�3���^r#yI�.5�����Q�"Ă�:c��b�]g�IL��(꧞�(Y��
�$A-�ڰ�z�TΣ�ӿUF�9!s�շAPR�a�o\�(��{�k��
n h\�eV��$�i�rA�]�)(3'ONG�):l�Ƽ=v#�r������w���������5�}4��L�/S5��|�dFӜ�\rt�E��7���A�]d��w)#u�F�m��(]Ӧ�G2md�`.�H�ɑ� ��X�#a��W�b��@��Q:Ҙd��:|�m.PAv�W�&�NXv��vv�_�p��>R �c�M[�c}�N>C�9�O�Q��`Wn"� ��	w%�tz�gn� �|������&���$�k�q0 ��l�����oHp#�WH��"�\L_��px�mo�wo�H���#�#�sI���E8<Юj	�g7U���;�%I�$��_��D��It��^�*!�������n+1W���ῇ�8!-b���F`Ź����?
Y�%r?_��_�3��2���
c��tΛR� ,o ��Md����$�<�����mD��i�[UC6o*�]��(��&����w��&�oh�-iK�+d4���R��w����/fV�+I�	�5��[��݈�5��b�: p�����9�t����� �_�;@�VJ�̇��EP�N��:��O�2���8�����f��c��|A�ti���L<��xf��v�D�W������h !6�茙Q���sm���S?�I�������	���g�����I4^�mZ�mq J/&�N�e��)�V�':$���]�Ҏ0	X�#qzf��x��\җ�P�>з)�Hu�G�RpȖ���@g���D�F@���(�q���T&#A��`g^hQ\�;#�ݍ�������a]�Yy��û��kO��h9���I=H���}���C=�l'�?���_�Gӷ���s��ɖ�r"���PYU�P��~S%w�Ev.�6S�Cv��`�z�*�$Sq٭�]��{G��HC�pҀ/k�d�&���mq��&�j$�EЃ�|hWƙħ��2�������%�����9�%Z2�	"�W���D\�.iL4H	�D�_�*@Q�_��M��g��L��I�_�co;0���y�	b
��{�P�I}�5_`��x�$����p=��Rj_��p��4�o�ɐ��(�cҐ�	����(�<���m��Nf�v�m�X�Dw�����p�X��V������O�<��=ƽQ���î?���uaAʡ�ۥ��O<-S@<����T�U�"[|^.�'L��8�&vn����|�%�Z�I�{���5����r�JY��5q�8WDN�c�I��1�n���h��BǴ���
*AϚ�U�}L���S��F���"��`Fe�>��]/~?o(���"�팆c�M'zC?��隆[�!|�TlI3a��8\��d����x@x�@5|�7��a��N���������[K��	�߻�4���ɐ�x�sKo��t�Mbo�/������w�0)4n�%�UB���z}t=�ŻP�y�]�S�_�eUK�����K^h���'�&�a���a �,kB*Am`D�Dp��p_5ӱ�U(�����`���E B,�'Ŷ� fs��{�m�������%Q�X���R�k'K�[�o-?�T�\��E�B��RO�8�Ǎz�<-���_TgY��5h>X��a���������ˍ���>^���l�K�0C�	��[�h'J"�.���~-�Z�V$e���[���Vՙ	�\��8nﮗS�(%4c��pԭPE4ۿ8'�����n̶z�}���r��M����k�_�D����y)����0=h����Y�B��v<��n�D�v�`�c�8��*7�<9T%;�ˬ��HF�J�aE8����ө�
3��N�]�nx�o�[�U��>�)i1j�ߛ6���D���o^�R�ܪ坯`ˁD�[
}��Y��v*O3�)��3�X37P7ͅ�ϟ�zO�����~y�M���j�<��$��8�U�r�[g�Xg�Cs:��H^'�����[FbT-[�5����|6���Ǖ"k�8���D35x�`l���*����c!,��,�مZ�W�G��K�\`6�擠��R��*�ű�� r~�f�EP}53���2Q;w%`^ȭ�9Jc���c�m<�)�x��/?�q��u0���޸��*�����&b��v�`��H����NA���<�D��!�Ƃn�GQ��B)����k`�J0]{4:�o
�qam�s,}.�
ĘW(qNrQ��:+2�3�:��� �   ��C��j�/�ok�@�2Z[��JA�w@s̲���]�B���y��Q(O.:\?P�V4� �?_j{G��I��K5���]��a�� ǅk�h9��%� �G�j<~XI�����i���Q��$���@�l�K���6\<��V��H5"��r=~ �N�2bm&J���3�HR4�k��d�l�2��zJ�jצ��4z����
��i���v&Ò��k;�˚�8�1�Kb��K5�l?��׏?�� �      �      x���ג�V���;�b�#xWsKxCx��;��*��4U�KJ�"���r��眵A��95����_T>J��~�<^�j���C=T� �D%�n�,�8\4�u߱��efR3���Y�t�?wy�z�Gz��6�ͥ������!
����s8�"����-U��۝B�'o��捲G�nc�\��_��1t��yN%���������@�!��B������>����������7-�B�ސ�b�PA�i(h�2����[�Z��
���z�ՍL�=�Tν�+s�o)O���N��#�a�79$���/VѪ�<Q��Ã�#�-�D��jT��L0��5to�@�0͋�Pz��U��,N#�5�=����� �t}*~�Q�R"0<�`������{y���n׋!��.����a+��)�f����(�#�����ή�bpD�A�ެ^p&D�J����[z�P���Ħ�̆}?�Շ�K��G��S`�VP�����0�7�9����@ǗiSX�!I������|/��t_h����`v4姨��& ��D1���_�#@��b�_F�?��?��A����x��{��V�z���s�p`{�	�#�+耴�2���x�T="-�=ۼ���L��f� ��ܠ�w'��k,0V]�3�,�F����7Rq�E;K����vp�<�p+�-y� ��Xd9\0h޹f���ݚYdK�[���b�LKBSR>�H�ʴ�G�N~7�����M{g��i��
��[*\y��?ԂЮ�l#��ۚ�ۈ-P��h���' x�G\�p�Ld����WG��:��7<g�Ε��jDu�<;&;��!L�ٗk	�,ٔ�K�Gp��d%�l�&|V3J�U>�d��N�4@�^�2e���` f��l���I�8N��<����L����i߮���ȿm D�k��������e��8��Ҫx>����eu?�zV�����{��ẌN�\�u�_�i��-��BNAXW4���P,��hK�����*�t�&������Lχ0�-9�h��ށ[H��#S��Â�(�J�4��<�Gξ��2ڢU ���J�D�
|Q�*t����/�?�+�`��f��
��[��i"vz�B����u����Ec0�k��|?���a��X�1 i7x��,���b���r��4���)N�J����v�-�I��b`�;�ׇ��ɍ�����`��ܒ�:�D��lQan�ߓ�Z �~���QQ&Xls��TZ�J��\�6�ZZ^;~��L�J|7���o��+|�7�oE F�<��`V�W�t���H�3x*���T�<{��^����X��e�jL���_,"���JRAC�^w
���*$�k];bgI���bf���
�C���*j�r��s�.��8⥖{Ev�2i�[՗���Kv���Ko+�E[$�?ҽ��F�lD�@��hA~��x��N���`�oIu�j�:R����S��P,w�@�5�u��X�U��㝸���m���)P�MP��py<�6��y輡�#�o,�ӆxމG=�*��\6VdP���*E���;L������!�_ƃ7b��f�c�_R?ey�,�g���t���P�0�LaU�>(#Ĥ^p5:��J~��~ �72�F��	����C�]䃽��P��o֙�-�^;�М�:�U2��0/�z�m �tA��Sz��5ġqE@�|m�j�N<9�vy�֫a?|�;+7��gV�� ����F>��J��|o��&n�Eg�2-
ٰ��a@U�5Cξ��<ffA
�|�l��9���:����
1��ƺSPxV��bQ�_�3�������~��{�?�s]+'j�B��g��0ͦ0��s�
)Ù���46�D���j@�غ�,E�ʝ�Vm�T=���V}�u�ه�`�s��� x��:Q�y����3&��Ԁ_�v �מ�ڭ~��t:a��k߰l^����$�Py'��L*��Ѐֆ�0:G�zjs���ئE�s��\�a�/�����J����~��{{�$�����*����i��z����N%k7 �G���A�VUH�0��̾W�S����k`��,��ǹa	C;/�0v��ۥ���ie�@���5����]�q�Ύ$_J1K(�&��M���~n��������H��M�`�<&�y?�Ҁ�cˍ*���:G�����P���?��O�������^䃽��
ոN��ih���T�+ 2q�*]u�ҝ66P�ǩ��R&e��������y=�x��H�{�Le���0w���F�;�=j$����ׯ���<R�0�R"LL�̍�����r�J�D��#o���Q./���Eo$i���
U�V��d��T�f{���t�R��P�u�~7���o�z��2�ݯ���Ʀ�Ѧ�z�+�8���N��L�Q`����C�J�aZ�s�V�"�;���5����NI�����b��d�Nyj��6�Љ�� ]��.)"�/S}��^�H4�bc��0�����=���%��L�`_��K�.��*���)K�8�$Nك��� I����Q��n�;����"����2�x�^�D�@0�}������Zެ�f��������a}�%��pG�UPidf1�^�y��:�0
�7����_�7���)����F�9���'�[
w�����a�-M�(�8�΄).���aK'�;�W#�Ś�+X�r��i��$�c�1�~����P�D���v�_�_��E>��1 YI��qл��$�����֌�����J�W�Ԟ�>����]e��)j��#�Iz�%�,�	�ȍln�5��B��LJ��J��$8���x0�φ}o=v��\�>|��P���|J%�=rK=��\R�m|s7@\���n�qէ�=��w-�����������zX�b(��6����~��{������K��T��8+k݉��  ��+��ˇ�llA�CN����������їg#��Е��X�oh�����B3IE�(+~��������Z�V�Ơ�8�b@h(ܳ���4'�ڍAJ������δq~QI���T����|��0%���d4a���T��F�y�g��g��_?�Q���^{���� ��i���I��e�bR7��ˆNk��)3�B���M�;��:�a>����	�W2O�5�m�����V�����02=��W�*V9���C��D�T�Ge�s�!��f�Yڙ�=��:�獲i�t��ь��bg��:��6��N����諒�	�ݩw��N}�~�7���p�ك�k6o�e���k6�x�рh��X�+8���]NT��f4�3�S/�>Ia�N;����f	F�<o;��F&�;D�W�i�:�?����Y�3�L�֞��A��� �W1ZnG�s�^:� ��uh�\$;G�΍�Mu��%�jǵH�x�J{�m������ѩo������LO���(`s�����H5T���&F>m�Ddj��8����V����bu�I\N׾l����x�S'�m�a5�!�Gl�3����טʎ^�y��0�LB��T���_M@$�t�H�N�|���,-�r�8���<0D������d�ͩw��N}�~�����W�v+���8O�q��(��]J׊�wa�P��U��(3l�'�^�y"t����AZ��O-�yef��+�o0LSn Z�-jC��BD��S�-5�DO;�1_kQ⌥	��~�k˛����`�;��9:�d8m�?�3�P���IT���n�4��������ѩo������]��aNE�TG��`żE�:��W�۳��j��Q�	����>���sU��&u��$(]���VZ�R��T�j"E��+:�.	}��L.����מ�P�sa��p�`�r�BR@FR�(���,a�L���/bi(�䴇Jɵ�p��F����S?�?;�U����}G��Zzi|3�qk�K(�c9i��u��z=8�҆�GzH�^~n2�+��9^�:t���ty�v=��$,���l�<��ZzO\���%����{o������:�    ���*�|�@��xU�Sv����fk�w7�:�FLᕥ�|>J]B�8�U���}��I~�v�{�����}���8�n�������H�y��.�!�"}�6P!-�c����!�1J�����PI��b��y�l˪�z�}��5prZ6D����&D��)7��j/a��v�X�Ig��m����2ڧn�f��;N�����/��.Q��E�9:ٹ���~���Q�pꗀ��ސwAq��ar� �ky٘�RĶo���1��'$��L��ma
�?����rE��:�{#���R�`�}*yƹ�"�6]<pH{;�V�J�	/X��u�C��Ͻ4o�ax��Kg����lW��4&}H����	u'��\���︊����Jð?�����O��N}�~�7�|O	W�t� �����C�ã��ЋkM6m�e���3}��"2�\�U��x�	���MK�~>�^V^R`j�}h+gK8+[C� ������"�B|(�<<�u������4=�(P4SvZ��I����,V���f1n�uЁ�� Ѧל})�3 A_�ɿ؟7�5��{Cޣ��6�JO��ء�IKn�{9��a��T(\����ژL���&��k%1G�o\���|�����$�ԏ f~��ĥ@�M�B�Dn}:���N�H���dT"�R6��qMi�؟�$�guW�.��Zi�v=<�=���ٳ��z�Z[��u�����[i�����}�M�֩o����Gsa:p/-��2C,�o����X[&.�	��n�5I��t�	����A��C£"�9M@F�oa�3�}!�F{�0K.۝W�G��D�0���<)-6���B؏����y���V�<6��~A�v�}�v/�f�:��D�Na� 띠uh�~Eu��4��}���0��>9E}w�7�O�}��5�.:̆v�
��o���b! a�+����X=ٝ_-��\���{q�-m���Yw,g\y�C���=~]�Wga��wo��!JT`�[��Z9h�8v֌�t� {*ǎ�����W�-g.�̩���j��sNq�����RO+G�Vڟ����O�����H?�7�}�T����/ѣ^�=�'|��'L�2��)1���#����`ЙyM%Uik���-�ͅ�Oh�D�QEg_��"�k�JX�e�9غ�V;m�j-����%|u��,=Ĉ��
��<MH�h=}c�q�n�<�+J�t*�^o/��Ұϛ�;������J?�7�=��	x�SeN��9k��X�DV�O=d�1�m�eŶC���JG�~e���G�"�~b��{V�[�[#� r�f��Q��#UK���ro��c��U�v?��
�Y�}Ń==�t��#n��_��M����Mș(��F���j�|uU���u-������`�τa�����g�~�~bo�{4�ɍ�厍�)�3�`lO@�;�VXB6�CL�0㵄�%�{�̓�Ah�3�pO�M�6ϼ0���=N���j���j��B޷��3ܶ�!����t�f����wM�"�5.����J���j	���s��Im�Y7��P���������8�����f�y��"�����h���^�o�Y��<�@;%	H���T��`��j�KSj�}���{:WA�5�ۢٚǡ6�r[�<���1j�2-.�it�JE:�g5��p���Gn`����U馌p��`Ľf��^����FF ���u3�u0w�R�S����~)���������:�~#�����hnj�=%��6�;��u���w��l�b,p���O4P��q���D,���W�i�W:����&�V,� ���;��)+)�L�n+�.�%b-�M��-����(�2�C�pr�M����txJ�Sa���;|[y:yvȕaD�n�Kz�&�k8~+���N�d��Sߥ���.�OϮݮ/�P6n̉����[���j'`�0����8��9��ȶt7m�cos.�^����4��#`ڬ�ZG錔zNl�Է�z�K��hA��J�uW$yV�d�X�2���9e�Ѧ�db�����"E�`#A2
��<���@

���o������O��N}�~bo�{�ޣ�*�:j�Ǚ�HU���4*��3�"؟x�e��k8̙��<�zM�ӂX�c��쾕	������.ѕ�9�R���a׆�� ���5����Ʋ�~�=�.N�	�Zu���'�T�Đ��i��#�cU�/6�兕�7(�ib�;>l�ӗ��?KC�/N�������O�}?D�
X�O.<�������0����.`y�km�L/;��%Uz��Bڮeb�nRqg$�}C�-)`%�ʬo�&?l��r��i�{����^�����2;H�yY-S�#�.k]8���Q��2���:p�/�St�8{%�<R+�W|7��9)���+�������Sߥ����ѻ�L�Ȉ1�,�@�7���ڌ/�yco�x9�+yE��*$�\}X�Ej�W��*�o�ZB��L�w���P/u�[r^=�,��х�J!I�����0����?T�T��k�$Xdk��A�^��C�Ch��P);gC.l��ԍ΢鵭�������?���9����S_���������Uǉ@vWc(=�ׂ��V7��Ʒ�1ĉ�05�I�,<˝nӲ���@���y5��C@W��_��F+G]�ak�@F�j���<��dA�9|��՝�
�Ӛ���hjEz{��A#G����^��ea�s$�
R�4��}/����ߝzg����'���gt���3Mi�t�V���Q��Bv�)�M �)F[ⴧ�9Q���������jt.�0�I����&D�<�l�~��ͤ����T��j+��.r�Cm�YL������-��+����'�<�'��x�Mj��k�N®�И��@@�(Z���{i�#�9����S_�����ѓٰ99AGpY�1�;T��BΎ7#�:��&��R�Fw�f�^L���L����
=��Mċ<�SMw'�'�������������ȝ@��J�G�T��fN����y�Ň�<���dDj��z[����<�L�jΘl"�^�����v���S_�����ѣ�7����§�[���$�.T�TXf\<bXn�1�C{�u�|�G����޽��m�5VRz�j(�}�p�fIm*�r���5�X=��鲒�С�����|�b�ǖ�u��u��JÖ���m��b�����"��`lE@+��}/������?;��^�_�{��re�Ba\�$�A%	��q<QF��bP�T�Vo$M�⩋��%�ʵ��7N�[�+�f��<�4VǑ�s�r��T��R$Ղq�y��i��rj�D�h�3�ѣ�|�b�����Q���`=�Nɱ�&i΄���&�k�Bh�7�O�Tcq_J{�*����:������{��3�t�a,g���6\�U�hJ��}5�!�H��2�$	���	
0>�|����7�LQ�WH�u�5xDy�P4�}�BDs�����bZg�I�;rL��F;tY}�&狊y�]���4��YjL+�v����p2�N��)�s��ا	�`����J?��ބu����k���n6��-���!�> ��:��SD�T"	'b�Ja5\^C�K$D^�Z�#Arղ��a���JF�)~��M�=/��.�s�j`v�iPŘ�k�(������FS��52I$;P��:�?�L/(\��em
 �������5�V�����������a�]�k�jE�4��yr;E�	/]pɌ��B\�6�����>c�ҷ��7׬G�ze�6:jjv������鷅�f],��&y�����4�5�u[c�8CwFZNU��P���p+�q8��w�#�ûu:�4�&�N���;�v���뽴K4��7�x%�陋? �S��{��a��ifPl�ۘ$�;�Xi��]�0� ذqV�o�A�w)wnf��`b0�����,�`E��k>\�-�	w��mc+TX;���ǐG�k"���%���ca�;p�n���@C�0oT5�:��x���ꭡ)��-�5Z�y�xv�t��    ��^�%O!�ϟ���M_u�{�ͨ�0�`[ƌ�j^����K�d�f�:g��Ap�h�6��\Q!*u�Y��{��C�S�Ӄ$͝;ƾ�zƲ�Ɇ˸'f���e�B�>����`wt�n���1�a%	V�V�N� ��9	�>���_&C�s�}������Pv��[i���y�C>�?6�7�{���ϱ �,
�XQ��(��Ŕe�h�[{��f�w6��ר,�5��г>��ym�N�
������*��o!Pц�s_�i���7��DȻ���PZ����Z�,y��d���I��Q�+&�#@�FbgE���.��
��zl��x��0�� �>���B!�_����g�~�~�7��	��EW����{�veuӇ^�t�_��EI]�;PZ��Ql�˾ǳJ��x<ۛ��P��c"���DZ���1˖� ����4C�>]{N�p�m��ؓ �&5Bq�G[��{�c�h�>���2�tQ*�!���4e�R�?��k{�x��B_2�Mi�o����S�������P z����-�,2)	�j�^�Z��<>I�fS���Z�:I��~,#G�+O�sF�\q"\s��yZ���RC��j�,�3�lф�\˃��GVH����i�u@h�q�-�NP�ym_g��͵i+k�f!}W[��F��*<��=�_�c���Sߤ�诿�%�"� ���`T$���׻)�f����#�����t��sM���L�(����?��E�=^���7�#���Qn*���t��a'��ҜM/r�NP�J{A�J��,蚋�k��v��禠�N�����EF/��>�$��q��`��:��S7�[i(�����N�d���7�{��z"��^~h�� ������V`�����u��bЕ$݄W����2��F3�	^���ik����h��)����๣��O�D�B��;��;�4-��&�Md_�aWQDﱥ�ЍG}����MXd�l� �d�;��$���x��}��B���ꧧ�a����迕~�7�=�3y��9ϫe�z��6r�!j�����ߒ�w�����5����dݲUw��� �k�#d]I]�86��	���=	W�}�L�5�J�->ĸ�l�Fdq�m���vQy���a����hz�s"iHָ[ݛ%�,cVt�e$ 	b1��
����`�)v�N���~
lv�[����ٗ����T�l�$_�Oݼ�"(I��w���4D��5��f��m$�����U#~�`<4�qD(���U�h;5��dK���J��T;�a����uăyT�!a�V��_�"���h���!=QF�~Ҿ����ˣ�:���~�~�7�g�lۦ���z�a�$7�7���U��¬�����60�ĩ��I���ԡ<`��E����6,(�.��K�q���#%�<�P�鹔V ��~Tx�^W�vO�j0�(C���2���9Y�h7G^hy�;7����Ad,h}���������^�O;������ِ���ÿ;�;�{��76�Fa��J���;����13;y�B�'!O��h�"p�Q�G6�T���2J��L�e��F�حr]`[l��-X����ֲ<��,��}����h�͹c_�b:���MLVi3| �,~�J���5АW�;e/Q��]&��G�cU>��g��⧠M}���O�N���������
M���\:�&��>:��-$���"Z�
���D�C���LH� �m6�.ܥ;gh�j?�MU����+�yV����s�څ�y=(�y���-:õ�{�Y8&�Df�"������A5$w�b35��#B$�Ȝ:S^��?�U�����0��g��f0��#�B�Aa�z������)����@̬��Õ������������f� ��7����G�f]x�)�A�W�u8�}�"��3��4ob��2g���a�LX�Ul9'l]��	�=�#�b����k|mIS���
�Qj�\��]�Ɨ�����7�j~it�{iԗ�����(��%)�N��ވ���i�"&[�x��g�܈��>+������v��q�|]�q{z,�#۞�2E\���>'rm�cN�D6���J�6�hdw���Z�v�L��)�S������D��-%�K�Tn'���/�CU����/�|��+;��p|+�5֢�7�~���7�{#ޓ:��T�:^�`�?l�eYP�Sv��(���nj*��2�Ɇt��]`�ğ�6�<Z�V^AY�D:s*	}�z��y_J�mw�-��Ku��
���Ɂ+�?~�U шU���NŽڈ�kcgt��u��la<������}D�ΚFMx.�������G�~z����a�����W���x�괡6�ٌO%S�b5���0|�7��-��z��ٚen�M�Dȼp���r���M�VWO-��U
���x��&r3� y�8#�\\�G
2���XT��n9� �}��r>�
k�b�,�]i��	>�)���=nǣ����*p�_|A_=�eܥ? ����S��~�7���|�q�W�~�n��Y}�i���5
Zv:?v����kˇ�Aw�a��H��"	�+6��J�p�}�z��ޜ���$�������>w ���a+��������B������%H=��;w1�PKz�4���Z6�m�O���� N�:y���Z�/��_G�����ǛT��}bo�{
�Ļ��we�(S3OlVEF���V����>�m�(�a�mo�3�^b婫�6�縣^�`�LPIDN�;
�X|B,ʢĎ-L�����^(��mwO0  S��]nǦkl��|E�P�<Z�s������[6�e�c��s��󓌟-�oF����)>�7�=>�m{��Q��Hd�ym0\�7YH��.W4�����+f�͗�d�]&�����?v���Qy�e�^����u"z�p�m�c'4P�V��6�*�z��W&�T��A%�8;>���פH��uf���� �1������&�ӌ��2��{#�W�`�O׃_��S�O�"�3u_�Z�r�@��#@��^�#{PU��S��SC�|^�H_A����^���*[�'�61'�Q@]U��s���޲���v�^Sw���=�k�V�܊��R*��j9�g!�ͻ�nk*x�N>a��zފ�l�=�t�m���.��A����ou�|OE��*��u7��>����;6�>���د��&2EQ\Z�0z5;p�K+E��V`�ۑv��I_�+�o9,D#؃�'�*�.���0sn�-�@�,_.,��M����zz��k��LQ����jp��cm�-M����J˶n��s�e��~�S�M?L!�D��������F�{u�vS=�U4�[V֒ �T�ꈳ�נ�Q�7؃�1�.�"�ї�t�ƿJ,�{y�l�C��+�j�P����@��Sᜟ�4�C���m�)�[У��mB �Ꚋ"H�B݃�c�J�'��_:������l���R��8�W��b0��B�JD���a����F����Z�v�'n?��p�a���$ee{�I	�C:<�4b1�(�����$����N��d��D�IQ��.��~9�`e6� \kd�ub|5�q5�|�4W>ލ����j��N���y��6������ ^��	zM#�a)洋E��SDM$d���^�)�ݫw�o��*�`o�{(�=A(0�iZ�w��@��e74u�����$mr��W��l}0�}��v#��d��.~:	u_��"�R�	�scsQ -uo��ů���.m�pW)�
N�y�}x�Ia:$��o�+zŹܑ�����;���L�#�����*���4��<[���'�^}�7�}�z1'uLX�b�)�h)XX�r���۸!-k(&���'J�n�>����[��E0���l�t'(T�@k%.��q��W+ ���qO�w�إX�ƭ|���T�:��^�?��i���� w��V����3�������Q�弴>�_K���;{��q�ƫ����s�    3Xz�j6!�Ŏk_�g�V8-C�k)n��G��#��-^"�{Ͳ唁�41τ5����=�(�%��Ƃ�9q�P��W
i�x0an�R,�-���}L��R~�;]����Gi��"q���摉���}�؉��㦁9K�)�Z�H/X~9���4�KD�?ؿ���/�bo� ���� ϣ�^���l�s2F�,��r
ٻ�{�"�(����hט�s�>ʊpJ.U�p1�;E�)�X��XH��6��j�Q�a\=�!��fm��tE�.� _�������q�2L���,���U2X�B`���^�A��8����Jé���_��?`��}��?�i�ūo��F��L�b�ַ�.�^������I��^�4.�|Xg$n|�d�`U}��kI�C-E"p�%Mu��P���z���	��N��Oe8���F��Hn�8���|�6T�(E�]��h��r���(.�l��R��/�1G�!�z��3c�Y\�_K�����^���������������8�P�����`���A9d��g��vzjh��JB+w�AX��+|�2�@��$�����PX9`��Kw�t�[�{:_,��!���K~��It�z�z�\�o�J��G3(�J�I�q�%�,\�b�ac���'�Cj9�Api>��'�z\)��3A_������E�������"^��3���x�ա�<�$��l.}н2�h����\|\��˻t�}�!��iDy|K���ÅgT��r�"���ҞmE�����:#�����;	I b��0;�<����R�P�t�P15��S��:O�T���T0��{G��4��7���W���x�U��ި�خ	n��#�>RR7^F��tS��\�[�h�C�`c
�W�*�����`���zv1�Ӆ���5��vF=��,D�Qpg.Z=�)��{$��t�фSE��u���#O��M��5tr�K��Xp��%t�&�X���C��״-���~�?�����>n�����g�~'�`o�{j��A���K�.f��@�$�2�[���p&�2� yb�t��D�D S���z"�H\�Ԓ70�Դ��`�F#��I���#!wu`�K�Ũl��A��BPF:ӂ;���y�0� )�S�werM �^60=6Z�A>3��~�f�4��ʎ���bN!�����zϡ��4�WV��|<�2���.ҁT�Ld������>@uL=�h�g���_�C"��ĥ�=7� ��e����Z�%W��⬰�3ۍ�E5u
o��Q�2q�l�햘��©����3^T�����C&�T��i��͉6Ƨ%�WJ$��`^]�ϥ���}���˩�٧�s�q�W�{���COkprʄma��]��=��F+��V�&c�?o��h��~�O2�P�^>a�5�4f�h��(��]<��������	X��&��Rv6f�;��?Pe��W�3�$�R�A�2�P���l�E޼κ.RC�&�P^�S�N��=k�j9�ϥ!����˩�هS?��~u�W�{��3(������Xr[Y�@�W_��8��F�@X��3�{K���{�M��s����c�Թ:�2�*�J������#^���S��*�h�d�8P`��ҽ�v����z�:�)|>���	r��~��':��k(q�K�⹵�EG�$u�tm
���R~qUe�lO��zôᮟ��Dw��.�����כjc�.V��ܰ5��ޝ��ͧK�me���?.���o �����+����~P�n�4޲�4�M��,GQ�إk�-�X�$�f��������ͻ��Ϳ�c�ۓ�T�2l��$��,ƾZ����u�ʵ���b}\Y�]AK�p�>���c�DhR=���<.$���	�m�*����Ѝ����������'Hek�0#.�fN�|L�K�/�������>s�Kx���5���f7��"A`��=�h`�Ʊ,Y)Y���5�Hܤ�
 ����L��jU~V%
h���1 c��BL��ir�ZC��&խʳ�+Ou�Y�
8+ޠ�����&$�ӂ�ЌA,o���*� cO�=�-�uM 1�x� �U��1�z�	�/�B�#�w���~c?��$����I�D�#�bo�pq5~�Ѥ"[�{�]0�G���  Hg� 5��X����>�qX�G����M	 )� :�����I�����~����s�����#
Z&I(�[���=S��2���+o�����kC�V����c-�_L����y����_k|�{����'��A}�u�S8_#�^�<d_���g&/�V�������x\���$Ƽ���cVJ��d���8���~�����P��^����r�8l�$�)'C��¾��M��af�q
+'�Ǆ�g����Bj غ#B^�Sa����+d�Ҟ��y)P��V
!���>z���i��������?G��e���b��0½a���]�5Ըs��$�psRg��L�.	���]yZ�B+&�\{e�1�tֿ�⫺ӕ�	�)J�jL̏|٩Y�E�aQ�cn^���\g'�R�MH��C��Ε������fCA�L���� ���-��'�VXw+14���ga^C�ِ����a�~��ߕ�����?�a 5�說���9P#|-�z;גKY� 49ٰ�8$#���4-m�״]3��	G
S��"� ~oBf�XH�a��g�	�\�p�C|���Uۨ(l�"�q�d&0�[�H�@5�%`���W�pH��8ц�
x��"0�� �u��4�#���ΏP���0�6�������L�z��+��Ҕ3.v�%Q\�j��/C�N�	�&�8E�k�׊�i2�hC�~��p�2�����@��%�U�� P
<@�x5j'����K ��y�e�9��<�1|l��:�L�竨qL'x��p w9**��2Ʋ�gF����v�ݴ_���R꫟�?*��'��W[U��ʧp	�����'ӊ�g��*����fF���^�W4��{atV��6{����3KL�TR+�d�h:����������'��{��v�p�Jg��M�����Rª@*Q땾�I:`�!t1y>�x�´�.�̑Z�Ɣԕ��q+���z�.�>�T�{+E�w�/؏�>YF�ae����n��P9Iw���e=�1�,XU~��րeF��se�������̩�xWZn!�Hs�GwBH1fD�D-[LHq� u�]U�/�-�	R�i�t��sGi����v_��&I����h&����tFe]A�O��������U� ��o{c?�ʿn���C�յ\ B:4�3\ԅI�H�����vC��}���v`W0_��<f���x�����b0���3\��=����ʺ���c��*�VA��.�'��4F�������[J��dVw0�Mn��~��(i��+3� Q����B)���A�[�m���m��b�J�E����T8��~����T_�*ڳ��{j��Rv����������9�k��΄:%�/}&d�Rp���8Z��@����*)���]�B�"r��[(˸^Gv-�W]��D���{�I^35�	��(�ewP�ջ����l�Y&��03!]����ѳ�I��/E��g��m#��h"����N���$�]�?q��K�ϩ��e1�H؊�t�!���]�5��k��`�HTi�m��t��4���j�$��Ff����H�җ�m���@�@
�C+ѹ*�H$�/���.)��5su�
�T���mO�U�z�HHE��D�p�%V ����ޫ�nm[��rAF��^��.��"?#ꍽP��Rb���R���Y�9������a�éZ��v.5�%�F�P7�KIJ�>s'���p|������R"t5]Rc`��Ԋ�"��}2u��ŀ��[��>�.p�~���~P=_H��{�?D�d;�pϽ�id��(�=��q�����*������ �9:~���}o��7�7�R�s��I!�^�����0������������L�Oɀ{:�P(��^U.�V ���	���VYI��    �������ܔpX�Γ5Q���p��Y�`j lx%8��%��&]~=+~W���	���o�v�֍�я���-.�t�Y8\��Ƕ��h�!�Ϟ����l���1�oZ����^Z}�`�f7��'꾡�ΨĐ$�p��	��a3P��*9Y�r�'��S�����Ł���K]kTR�K�����U�yp���ri���"�R�s��AS��K�-5%2���6��M �4h��s���e��g��u���}��C�&
�n0��Mr��m��]��Vc�I�߸o�
S�����e7�M��ֺ[�"�R�\���M:�^��[Fn� �m�_�*�/�KU�R�x#���p!(�'x����xw=��� ժ%|`&�����c���;b�t=�a4|�G2�i���ҍ��%���6rj͹��m��*�mg����]ؓ��/�?�2��&������C�}t���0�������~�������tb0Hl!G��#�p�UTZ�j�zB���S+�uѽ�"�wGi�\D��5��w��b0��p[wu5
�U���� �d6Q�������cm��Npa2��9
}���цqy����Tc4�d�x�� I�u��kh��G���8��v�����{�y������~������ij�!��UA�RhN�I��k>�R�@��:�� Ss�p�	px�?��(�%)��D�6�]���B��'(�Pd�GZ�r��J�W6��i�A\�8����-!ژ޵�����&1�Ь�nO��i���d�dǎS�s85��kY��e�`�h�b�ޔ�y/B��/����1��CF�1��}���F}%~��O�7��?�����)��7�t
C68߽�RO@ޘ��)^�>O�˗_E��Z���a��M�X%$�=M��U����_Kw��:��m�*eC�r����fv�ʒ"���
����9^ϛ�"|R��d�cZ�[A�A3�m�am ��MM��Ѭq�?��y_��������l�#/�C�#�����7�R듡�퀐>�i�]Xp@]��
׼Π�@�	�vm�uV��G��KAD@�����ƀ�}z
%c�
�h�h7<��W�	<�'6+���K�f�p��P��혝o�:%O�
Lq��ĤQAz��
���x��Hsa�)��NymilQY\7"J��6�q�Z��Oi����7���s��&�A"[�`6�|��Rx��S�vH��^����S]���WPg���/�5<�d�jeFz
���#:�ӭ�ْx ��M5;\���r�*������b�= ��^oHr[v�4�D_�6�'m�d��nS�4k]~���2�7�>�ſI���G��Q��K���H�!�1��w%p�x0��h7���.H��X�x�5������Jb��N��U�B��'	�K=T�m�Zڱ_�ɗA�5E�����M�JmA�'k@�e1b�1P[j���y��b���0j��S����\�>��#���tg(�o�p=�x����E����/���~Y��?�������̿�1��F�G����f3-O��f�!�@z��+��w�����#\��m;����e�D"���*(������l�s]O>��.�O~�Ƕ0=���N[ݒI�u�g���'|ߙ��#�U�n}{U��ބB��`����[NZp�c��\n�~�����g��K������o�7��z�tI r�p�z'��iX��5 	X��ƕͱZ�!�j'8��I� ���[�>)�ƮOBW�1/�T�j���2�`�e��>�<��Rs<0N������q�S��іfJ��n�:�%��Vy\)��q���)a��r��TC)�Ͷ_����k��P��������8���鶮���?�"'`Brix�lj���"6�d��5	K/����EI[�͛Oxi���0eym?[�>SU�`Ʀ�_p�(�ğ&�x�\<Vx����f��q�iWp�.�ZeXU���6�i��Y���;8���rx�/\��A�k�}��5!�����+�~e���Z�����Џ�%�^GS{!�'��O�����ن�e���ɔ!��*�Ǳ�L�4Ʒ.-� �K�I���_�,�ģ�c��)T�P�Du���T{�M
��f�����収+�8�Dd������s7a�N M�r�أ�oχO�f97fX����m��%?�/j��}�E�� ���җ�v����K�ϰ��L/┭$�����5��+C�����Jì�S��IG<��.��5??uCk�dY���\Yw����i,��8��&��DTY��ky0��]v�m�����q�J��n�2�� V��U.��{��-'��)�^������өbrpb�N٣�\�W������Ⱦl�?�A��_D���.����@1��z��GG�+z�Q �rqM�L���O�];��oE�Ȑ�2�]K����G���t�J'�t��%4�N-�r��5K�����Kh�[���t�RK�W�Qk��JGת��T/��2q�ގ�-iLRo�`����ª�|URn��N0�:xA`�R��l��C=���;�c��/��K�>���������|�S�[r�rU�g���u^c���>c.��g�"&�eH�;Xv�c�K��*�KjJx%T��9���wֺm�M������%.��}-��OVџ7.ۤ��WN�W|ÃW��K0�o�Ʋ�,]���f��7u�ٳ�ak-�^�]$ �A|@�!��9�OdG-I��o>�A��ؿ���羱�؏�����!*)`jA�nR7QLP���{&hKWA�m߮G�%�p&���	�%����]x�v�J�,�&���2T^@+^�E��6��5$}�Z6V���O�Cֈpx��e��
��%-J<�A�=���yr�Ke�J,��칠�E�.n;^s���J��njV޺{���#Cߛ��������B�`��ןE����~��W�~�B���	i�\JE/�H�+u0ѽC�j�tae������j���_|�(���������*5�V�/�ިWh�c�C��Qb�̪����P��
X'i0.l!ķ����5�k���8�X�%�ny{>��>�tظ���.P�	ybG��8���ޫ�n��?�V����.�&��
�?��؏���ʵnOQ��� r���2j��D�]�j�C[9h����X�3]O��˰3�"R9zeiUS�;�af�H�Ҥ��sx-���̊Զߍ<��qx���Ҥ��S���A��`��2Co�L�#m��}��,6�a9��_�K�$�
�#0�w�M-�$!()��g�������1����XW��`����܎�T=o!A��Iv5S�X��K^]� g�T�N�TIcba*�1Ělj�lnG㜲�D.)/A	
��K`b�l�����Vy�2��=����,���qP	`N����p5��a�\���!߇�X���ZR�If"L8�Ҡ'���N��������n��ZR��Q�c5"��^�����~������� Y���qoЂ������Im�y���l�N	ǩ��D!z���&:d��w4.&yy��C{�=:���&��H�1�I,��i�hn2)f �8����D��"{����l�R��X�?�A6�=l��PL�$b�5D�l0r8Yϟ���
�Qo��Z�_��Z����~�_�>BNH8e��=n7��Gu��a�h�M�i�f�&��\���|O��>ӷ�@��N��Ld�U@Y���=R;�S醹���_�|�UH }hp\DS,�2�8����	FC��殄�9~�	d������a� ��v�|���)��t���*7�����]Co��Tmao��	����O�7�E�x!��X��;�<`�'�I�öIAkP�k�`^5}j���&��O�"ֶ�+�1��\!� �]o� Arv
g�bW-��1���^��r���u�����(�UO�6���4x�=O8�DD�i�._p�,���:eW����^�t
���-�+�U���wūū!��k��e���WF�7��7��    ����"�kc����}����~P��R�4�1#.X-�������MYa��*D��u׊
�gbK�����S1M+w�5���m&�f�vR�`�/xtLK􌂻_����|�!�8�s9E�����_�&��){�З�*��m���i�[��KF�����`�~�������m�ο�����}�dKAq�\��-�B�};1GO�����S�A���g�Y�7�[�͖�ў�E�l�k�a��GYu�kf«���K'8�O��՞�!8Q��2�:P�+�j��	�z<�����H���
��k��t	�k�p.�8q�;�H=��6ܴ�58��o���|��������O�7��z�^n������g������tr4����3p��F`sS=ɺAwI҅&=��H=�`R��8v����㬱k1��R�&r��Fuq��oB�r�0y�hB3�k�YDu̚MLm!C�5���N�#0oƩwmK�H���\MQ<Y�%��?�>�.ű7�%��M������^J}�=^\XVS���h:(�w��[G��RUdC�\����s�����Ǻ��h�|�xdN�w`��hq�:�=MV_!k_i���[gʌ�1)6ޭ}��T�xr*_�x�d5^���k��`��c�Vk�K���T�_Yb�@'@�q)8�|������l�hI��)���'��1����B�mx�#ԓ[�?��A����� ��.6���z[����v$>��&�y5��Z�3�.s�8��]�&+�7�=�*W��~��;@�W�dm��������1C�����H���� �2ˍ���SK6�.��708�RO�PN���^���o��o����G�ο�?�U�q��K��T��&[�7�yS`A� �k"������J�j�q�lc4����du=��$��:fEC$��)ٯ�k��+�w�u�l#���3���y�nTm2�~B����U�%?N"����8cr��Q[�Tw;��J����YY9Zh��z!k��n�Oǟ�������7�{)��S�=.�x5�����M�f�lʴ�����ށ�����	� 3�Z�%B���miǸ����*ӞP�L���*�Z���K^����^aD$�!f$H���#^u.����rM���|{��"A�)���ƹ"����e�%HZ�p��ݘ'�m��An�:� ��m��7���A�lG�9]�⣀v:uGrǬh\U,��̖-���^I��)-Yy�(�6�}�
���(���M��m��q숌#�\����(�j�X8@�����.��D7��cO8?�'N� 't�����̞��/J|�bXqvJK�9���JY�����?������-�>�"���{	��+�o�o��uYr4d5�f�M��6����j���>a��j����y�|�3�Qo��)�ӄ7o�񨹓KK�%tH{<��?]�<�}�7�4]���{<>rU�y7s��j�c����e��p���`e!%$��H�h��<�lS�!�yf�$[m���/�}ޘ�sQ����s������� H���3�Uf�~U����ܾй���$;�82X�Ճ�׈��WU�	��q	S������'�u��@\�����$+,{��JhO��$E�f͸j���f_���2`\���vk"��ݼ�μ�pc�ba6Gj"�^ΡG!��xyZI���3�ߵ����~徱�V��L(���Ct$<J�L��~� �|j��[���tG��ͬ#�	(��C�ε�����k��Q�j����+�͢ɉrs���Mji������/�2��V�d}�-p=�G0{��`�;2D��$�9����+>^��%|#�.�_s���g�#�#�m��Q���zO�?k�+�����k�;�mhDQsP�]r{l�>�EHBlW�f�Z�:���d���8aDH�uW����˗�j=�-̞+ޘ�'�lk�}��S�T��j�.pz�9�e"���C3B��{n��QO��+7,�0�׺��)`o��q���p$�?�1���Okɾ�¯q�M�/�� �k��o�o�%���Kz
�
��ﳛ�^1���p�^�n8��pU�g�FӗI�r7d�"�c�"�����f��H�В:IͿ�j����.	�{�T�P�~�ܵ��2�R�K�4��î���:�x����"�`��'��| ��97��H!U��q��+
������~徱�X_��J���by��?����+Ӏ��
�4����J;���9����YX���g�;��J��Zb�!V�=b���\v?�Bv����X��,/Rm�l^Ѯ�[IB�t.�,�^6T��
��%��"2z�v��׻�dEr�p�"�!��B{�w�����?b}b��X�r����Z�������s�@i�������y ��ѥ�EҮP�bd��Tܨ��	��8љ!o�D'��3�"�w��Ό��$��
2 %	�G�~.�=�A����݁�,�7!d����,�0،��؇Fd{##0��D�A�h;����[��}������~:��p�7�7�R��i�rb
�`p�z�2*b:ad�$��By��$;�	���s��S���M�;z|d0R"����G��s� |\�K�$�:�}�\ m&�Q�� �u�@�W|X�W�S�]y4)d��FZw}��
t�;���G�'�ڪ��\���M�H��o�}�����\�w�{��5i��ҧ�$�#_3�}���Pŭ $N]<H'���d��W��*%u�����ڍl�,��K��w�`�W�CO/yel��$��1���0r��j�ԧ̻p�m?�n��~��\4TsF�+���g$�.E(�Y��Iƿ~/�EG:.�����qLSCG���7{�6��X���Z��o�L~�U��l�Z�_!-�·��ɫ��8@ 3�da�0Z��׏s=[P�{��P1\��V@�?�oG����:�$�m30K�S���D����E��r�Sbl`(��Db	;�FT�5y�4�	֒�xc�<� r����Z�䑂{��;�qv��Q��b������k}㾱�X_��$h��m�����eͅ}
���M������ tJvx�e�t��obx����f���"2�ԣ�)&���,i�j{E�t[[��eD����Vb3�*�#�.���"d^g�nDM+�m��ӏ�ľ�"�1!x"yV�O^y�@�Ny�Ǿ�K������9��	爊���[�B�����>���8n�ޤi�T����f�]���@��3�����b8��K>�� ��Xcv��\p'����~���ִ�b�i+<|C�0��/#�o��P�M��o/�>��j\Ľ�Vo0�Ś4M�D^�=o�)����ߙ�q��		�?0����/}��`�}'�O�7����ʏ�k����E���7��d��q���>8�)h#g(~O����_95B	^�/��B��,	N�w\\Ff�sn��|֑IP.>���2D��6SZ�ѭ��洖M�xw�&�G��
+����Fp��,��#��nW�dZ!������t��S�x����߸o�%�WH��2��{����h�hn�LoEs�~��~��!���p}H�h��C�Cگ�>Gũ��y����^����>�K��j��d���`��{� f�A��S�0W��>���_|7��.j���K,칇����΅�> $#ua�䒠���͸����7����8��F~c?>N�}��A�w��bx�k���=�u`�K�X�%3�����p�E�6N��(I�(���񮼨��to�<��J�f����/��CbzO������@1mc u��t>���6�c��y���\A��g��T����^���;!6�w֙#�KX"�l��9�G�o�G-�3������H�+�����b[]H��~�D�^�g�y�\ua�8+~x��{�Cs�[���5:�S)۬��i�ȋH�Y*��w�b#����ދ�y2'm4j~��k9����E\hS��)ioj[X��p����9��$��{l@��	�}G�-�,��0    E*�x*��k@�>.C~u�������Q���o�֗3�1G��z����EG�i�n<� �3��K����u���$Kr����q�a�G����NC}�3��.�!����W�ض�2�w��	M��Y�մ+p��i��!�W��e�*O��(�%�a�%H��b�M��Ž�$.#�류Y���[�_�����Hl�lH��K�ȗ�����w?�_�$�������+V~��z�SBK5��Ay� �[�����L��d�Ob3��6Cwƣ$��;hvE�iM��=
`�h�N��g`�h���?���MN>��q~ܩQ��������=��C�6`���Be��P�ۆ�$�q�	�7�ٯǙMV��n�P��K�z��%���S�K����@-M~���S�����~��_G� ���U������'Օ�F���I��/���̺Y��F�K��I��/bs�ck��� ��ȘCc��`�t��w&���w���:8�~#	����p#��R�т�G]�g^Y�o2�~��a^
����a��S'U85U�� �!�u��2XY���ԴL�������/:�7��8�7�{��v)�Ψ�EÍ�ٌ5}�s�	9�x:	�[�=3<� ��V�����{g��nI�u������v�O����K�خ�	d�kj�~��\����%;QRE�Y=��y�<[���퀪�<��#§�i��[2��^-����rt-����u�t�_��?�ھ�tc�)�����~��W�4V35
��PL�h#l��:MJ�2�q\��7����׀Lc�K'Yɰ�m�"�<�7R�x�t{��Q.#��,ù%�Mh�Tt^|�n�fB��o<k�j��*�HɬJ�w>���{�A�����r��x�5+���c_Zw���e\{�-���^Z+��#�!�:}}��YB~�A���ԺE������'�{��?�Ǌ�@�@ćP�\�N����^�m��׷��B���^r�A�k����1QA���y_E=jwr@�G1Я:K��G �-_��y��K+Uטv���{}�b\�=� �!z���m$�>%l��iz�T1�fA�\�&q
V�&�7��`�լo>�:��|���zEW��r�7��F~c/���n��q���h�G��tMXq"�)&H䪧,V�2�"@� d���������a�)�HXD�ˏ���R�B�!<�>���X�����/��^�	�V�+��DTpHT��!�҈���i�w���d�@#�(�	J�/8 ��9wu�J��*t���q(��f"������}c/��7]�`(ob�����^��+p�Y��ɞ�AY��.�r��XK*��X�7�]�G�]u{!��;�j���L�H�c$�Dw/�ͻ3��U�n�r����a�i�׀�ؓ��Czy<��B3�3���S�	d�	9��z��-Yj��1�U�5�|�s�D{^D��#ߣ�������z��������~�4��E�2� S��JZ6ug�c���ac-k�8�]��!�1t
�P�b㙠7Oǌ������-Σ �Z�� ��]G��|<I1��7��?h-���8���o�O<2�J��g�����E��1��bh4e���6oI?��bBZ` d[y~)2;�	x����5����7!?6��oB~a�����o�%�W�R��8�e*�\1b�<?�a����=�"��-dO�u=nӖ+�I��X
���:Q��ܧe�Ŋ��x����%<,�x���L�s]�ǭ�po������T� 
���:Q������m���q3W:'�֧(�1�e�Q$ˌ���������w�����S�s�������ʁ��G�JcM���"IS�1��ðV]�F9�x��b˺z��Sϛ����{@@�׸`�����n�p\R��8�&4%%ǚ�.w-��i1g��^A�<�]�l/ycQ/��>@������a��Kl���[��-5/�����bYuӽ� ��}&t���	х�W������������������V�X���h�+a���C�; $(O��0-E�l���O��bej��+�_@|�(p�R?�ViS2t�uk�힬�E��#	��j	������U�����_4�<Þ�����D�����wI�%�U�A���\f�:��mK.��L�C�$�ږ`V��Y�vx�Q@�}"|UP��������c/!��[W2�l�q�R1*�Hײ�/���Sm&��r���o'(	a �	.ߤq���6rH��ڝ�L���Cz7/`Q>Dk����5���>7���]t#�s�vY������w�^�R��*)o8v��/+4%+�����T�p^�{4u%?eC�PuH�@���zj�|I\ �߄�=�����N�o�7���ϼ������"�4�жT'|��Ћg�My�\B��S��'��Kg��܃e� ����6���bǫ'۰b�=�yqO�)=�
0�I���_T�$9�2�^*#w�+��bY��ў��c9�^����k�"j4��a:��{|�.\��D�N���~�2C~[����Y�o�7�R�k�Z�b�Ŝ��$ ��\�/����n��;]V���+��:r ��^�W(��C���|�
\��5X^$��i�Ҋo�K���L�M�j�%�M��>75ƥr������:h@_t4m?^\�>��K��� G�Ku���{�Ɉ�j��j0��q���B�/���~�� �ݷ�D~c?��s�X�(��؟f=���>��8��C���TQ�־k��%|v�c�oD��%�ֵ�%U�a��]a��ԇm� �)����=��u7q�;��[�`�9�E�Q	l/i?�I�J_�	>u�vOM��n1z
uH�f1������O��ƅu��Y�̳D���	�gB�}����/�A�[���῱��e+��o�ݔ�z����u�[�ׄ*�.�aH��,~����8�8�6�W�̘��Ml�����*uR�з�!N��s�d�h�Ɨ���j8�h��N�\�nõ�(�'�Xɑ&@��s�^2%�#��A���,xU#;��H�n��&��jݰ��9�����IqЙ�MH�%m���'�7�{	�U��ԍJH����J)�ѕ���|��`/��]=)�sT�9u�G�>�W�+텯�+܍v�H=}p�t�m�5p�i˯���M�I���y��U:�Cq�6�o� �>,�����5��B�yT�+j��􅛽fO����~9�S��.^:��q���/I�����?� ����^j}�}�&�º��l��P�����\9r���2M0b�B�-�͉̥q{��,W�Q�bYKg�����4i@���p����1�^�q+I���b�#b��w�F�uã��4��~��Ҵ(q�L��T���U��@Uf�T8U�k�(2%�5���AV�.��7�r�fe^�1n���2���A^�=v}��$h[�#�ƞ�p$^�bf	�[�[_�z�^"h�_�p<����Z��i������&�zk�ô����� ?����^4㌚�hF������-��5�A��=�Y)-�e�^�8hfq�r��~i�b?��Z���I�2��ZS���k���fZ/��k�.�8�E���cs�W�{,ׇK�I�^R!KJ�~�4���i�V���ND�[R}�����P����^�,g?��(��H#�� �q����������� ?#�\�"u狄�,v,8�4��%�_Y��j�T�y�ا�k�3!��4U]V�Ǒ�g$�ik2&�����p+(�Y��169dz�tt�L�}p��|�*�ԍ���bȹ/.��Z���]�9��!��m�M�6�O��Έ��6��j�4\h8k
/���@��5[�?����o���֑�`�Cf�&8�-}�����!��[_k�
=6��&��D�i����EC�?D�b���\k0+����{�z��.in@���.Mgr���W���m
wܴQ��Ls ��1f��Ջ�h�G�܏ػ�/��(9���|�)N?��ep�G�)���������o�/���x�~T�j�m,]�[�    �%���^m=	T#H/ϊ�X6#��m���p!��nGy�O{�
�0G�}А|鲩K�5u�3�S�y���QN	��H�)��~��V�z�a5w�N���T�x�l�;1t����P���󂇥jF8��-�y�����%~�������$k��ι������b�$׮��2��+&�%H�g�Ҙ�-��,_C�,iQ�3�O�M�\o�W/���/��B�x���1u͏z	��1QCv��EI�I(A�����m����|F~��K�juk(D@�9\��~�&���&�t��3��D���>��w/-�罻�/m��y���[�A>�d<x�?����ꬩu��������{r�j§����׮iq��F@��H���5~��u���Q<Ι�)WnZM36���4$�e���d5�������1���w�H��AQ���i�g�@7�5xq+@:@�L���y���C8���Z<q~�"�#����z��OqJI��鋓�~<Ǥޗ�?)��~�-��?�����}�M��n��������j����1�Z��$�tPgr�&@bsv�n�B���X��e�4�	 �Ci��y���[�v�	YO����'�M��J�!N1�@e��x�U�"e�i��ZY"껀8���z��쩫.�g[�b��ؗ4@Hy�8�ϱ)��It����E� ��'G��r��~k��������s�;/Q�mӹT;@���?��U����/p I��y	��	��V��f��E���/"(ӵ]����G��S8��ȑ���q$Ķ��W�xç��"`��E�>OO�i@���\oͭ�f�9Yӣ�X̀S�����%�N�BK�{�'9�W6�A?��[C����o���1�E;i}��S�^y�:r������F#H�@�(.����<C���K�u���9��x� ���"�-�w�k̉��F<��i~	}��ӔtJ��L}���T�rF�`���|��vx|���QO �Dѣ�t�&w��]�ª����"��0@����R�{��@��8�W���2��p�T
���_��e���S�85�|�z�n�}c����~n�H��7����Px�;����e�q.٠kr�?����A�<졏�=���Iu�%�ڃ�kY��D+������4�K��xA�vq_�Q[9���G,`k��D����wD�;��r�L^e���mT�x�AeἮH��g\}��%�3h��о,���/��P���\�;X�����>w���z�ݍ�9C��<z����̃4�ZX9��&(^��H�W����^(cUE����sڴ?�6���a����5鷤��W ����Fv�<B�+	U3sQr
����0�!����E�ܹ�纁���Ï; ��z����%i��h1}�4�!�5�0���$�=q���}�s�&-l�7D�kY�s�a߸�o��N���3�܃������}��Ӑ�1�o/��2�������u?5���58�[��k	K�ޮ�42��Cڿ�D���{H���Ut.���ާ뽺E�8����S�dg��b����!%��M]�Yu� oҗ�����(�	�H�Ol��D�(�j��:0m��'J*�~�}Dg�\&B�����������3�1�����</@L��`;ic�ܧ&�]��n�7yu�~k`�6:ڂi�/Hz��w�\�Υ�0�9?7,�(�|�;���v;���N���b��qYqI�`-J������3x�8l�Ǣ�	h�0���� ?g �n�S�s^����ܤt��ly��fF��@�?�ȟ�9���/ډ�ә�<�G�%cǎ f=��~���(�c!���[]2����h*w"k�\�hF���jЪ��쯖\��@7���bNAIln�~SnǶ����@l��Պ���19<'ж;��:k�K�-^u]af�����Bch�.���c��:)X����bQ�>���bC������b���Z��z>����?�	��q����N�_�K��)����(��	��H���g�[禪7�~��iY�)@�w	ALۥKc��Kg�F.�B����.��	2�tE	I����#�EC�nM]�ɩ���~�1�a*��Hس�Q���8��/s��)�"��b0쀤��E.�90q�h,L9*\@�R#� �sT`�>����ǯ� ��(.B�z����[���N�ܐ���<�/�~���d�F�\��as�U��wL��1*d�A���gKБAU�BeK]�I��.mL�r�o*vɇg�j��s��5̓4��"w�7�E��>5�>��.w1苉ʼS]H��.Eu~B�C�&W�DQ��"�i����tՔ����2B���Ѫh�?��5�����o������.��R{l��>�zj�DJہq� �:=��5X����{�z�?#TFV�c\ ��Y;�Di{��]��q%�[jY�M��8�"My��Xoڸ�/�҆:K�P˭A�U��h9�wv�R�Je�<0#3�c�f����Z8*���?R/��[O{k_��A�;���}����
7gW�s��}��3�5�ASc��
\�Pg����|��0�}�`��*b�;�ԥ��;ߨ�08> ң%m핹�Q�n��k%R9d�<B����=���,͕�h3/#�d��P�G?��?�K��%��Q�"@��	�1�R"�_�@	?�n� �o헃�>o������sa[�F�S彌P��"\���͑�Q`JE�T�0�!CUg�%_�W�W��Ɏ�S��rsa�G�)M�$YRQ\�1���j�;�3�� b���rG��C7~�u���&_�d�9����h��w=����?J�[��_�+>_>�{�:�-��+�j1��*e��H4�B�w`�I��������,��ҷ�o��	�VL�=l�d��,Q`BF>iF�z�WJ�)�3'��3��F"�D^�_U��+F���������Ŷ��J��a�&�]�u"'=�s�����9�\����Q������"�-�h�#������a����\�����_J/G�L�90�(��it!��':Ԉe��ؙ��@~j������	�3��Y!����ힹC*$�D����Z��jo��v�:�v���*5�\9\���T6M<߼�m�Ř:h����]��^�0�q;��	��Յb�*����C���^F7].%�2�(���&���/���9<���g��1c���jG&mR�%6�f\s���eFj|
w��q�$�n�o�?���W��v��L����/1
?�V��H�l�nsf��V	1r/�]���k�\Y춦�+��7��ٽ�VB�'|�&�)\���]���i'�| ˠ�R=�� �d3�&;c�3�J��ϱXt��::;[� �A�q�E	����7�p�{�t�a�V �e�y���.�&{���2��D?*����?��@���/���?���_?����n�L�l��p��.��>�ʭ�q�k�^R6WF8Ad����h�&M\���W{=h�P����k�hz�|��or{ݨc{�o��V�����/K	�oU&�k�%N$ec�\��E�ƫ����pP$�mp!�9w%ıi"��5��(.��D;:		ZRW�4Dz��39R�ڜ��A��|��T��O�?e(�`��N���5SM��D<��t�]-
����mSq��BQ�"���9�ݾ0����x�� EG����vkx� �� ~����
�	dFaŇl7�Ns��"JN�����30�"�v��\��x&yG���Q�a8��!3�	�e��Ēw] [x�;|AC���ߓ�?��}j؏>j@��歝�>�fy�Wj��f����v
R,�@����2ڸ|!���{d���[�O��S�/&��D�ԊEƲ�?�� B�2:t�ҩW`��o4_��Um�ů$�
�h�G�U�{�z��^����6�A�TTɘh��B���0v�3�������)���?@�j���B�>OD��Ϥ�z|�*�pc?�.M��*����4n� h����+��Ӂ V�d��jC    &{���a��Fb,X��G=g
%����vf�&�߫9���4�P�Th�� �Q�rc7u�x���B���S�Ze�j6��-Ӹ���%��@f�Nl��#֍�r�;��<7�k�8*������?�]C"�ڿw6����a�?@~g��N���a�8^3E���,�
�D05�<qs���E7o
'O���˧Rxu/&/��nA<�=�j�
�C��$�N��Ʉ<�W2��=(yJܛG��� |[���	����'��ߍ��i<~n&�n�N�ؕS�^i˚$:���H���Q��o�C�+�H#Rk������%��q,��5��7�o���l�Y���~�b�p�PݣE�3���*�,=��:CV=\Z�v���9�����# �B�=��s���3���@$�5�
����	���	�!�i�U|(��Q�6ţ�l�O�����Tm����	?L��y����"94�ɷ�Z-�NX� ��̢k���O/�����<#�tvGe�o?Υ��7?0�[�Y�T���~g��N��6�PPG�B�D�����ƺh�恙7u����#1���%Dd�s��Y+���� �\�|��*���M���&D�pC�/�ʠ�����U��*�+v�	�j�4�%����H�p0#��Ҋ��J��{m��L��F,3��[9W�K��E��ep�G��_72���Rt�����o������+���y鳬]���X<��L[���w�d�Az4�}��sLr�V�3�5�f/Zi�j��L���K敉ӥ
�L�|�*���}^��R^(�����X�G�����˃�L����yq=*W��@k�i�.���J/SFarq��ǗoIt韤l���]!3��6�~���m�������?�||�G�vb���gn�������Nx!�?!��)�)��{�oehjiNf�Q��
���_Q��XR�Y���f��{</���sEC�ҥ�׌s�@X=�8&��aZO�t8^������*�F�]Y;�]�ܾ]8��E��{%Q��ȉl2#�ͫ�;:�xy�x�Sc3�9Qd������%~���}���l�����?��4���w�ۊY���T�*�4�)����b����V�	U��Dgx6��:.�/�����:���Ǘ�)j;^f.{�qE'g%U�$6݈� L��y�\|;&2�[I����;sM)ԣ�܁�AXC��뗢g璆�H;د�( �����rM���K"�W.���{\��H�¾b���w�X��#�c���Gx�|ݧ[���Ӎ��N,pr\Y��H͏Jf�1S1�K�r�u�b���r#{s:���x����, �G�^�2/����H�r4=�J�}�dD�������nvNpU�0�3������}�O��I��6� ��q�ˠ6"R��,!���/�h� DG}�Ws5��g�9h������w�������~k���si/�x1o[
CƑgl�xח>E��N҈� g�O���+,(=�Nv(Y�1�>䩯��
&7�;IJ��98�Q���C��S��9q�j���lKd�wKn�y�|��Y�Y��Q#�Xk�b��G�����/��u0r��$!�@c�����?:��:���	��~}X��������������<�{�����(����S{92۰#�N܉�xPGzP閷�r����l>~���]a�N���ش�Ⱦ��;t�n�'4�X*`��sH�1(j���z�/�^؊w�)ign�� }�*YZF���WАM T�-=d&7�c�h�@<@0~�^����0�]
����v�>Y�������a����"r(a����iL޶Hϔ��>e� �0A� �(����3+�����kB�����&�x�!���#S.�$}����2�x�\F�P;*���X��9Ϫ�k!�5/���b�uQ��<���kM��2H�i�i��ڂ��JHe^2���9gF������ް��:��[;i}>��V5�I�6���>���_.j�Cu��%�hEc�`�1�4]q����L���K�9������C�ԕ�@,��k���&�%T�O=�b�M �%����p�w�MAه����^�:ҋ��L�)ׯS�06��4q�%{��#���J?��esF0ݙ� .3�k��xy�S��R?(�[��B�:Rߙ���#�c4����1�- �
�8����O��:�0LV�\�t3S�j&/�k6�\,�(%����|��\y[n*iN�l�I�}3PAA1S���c��PԿ���ɰ��a�Y8��9�c�)
q�
�mn��h�[Px�ȣ�-���W45�u�7y�cbFm[��H��o�o��]����w���[;9~n�%���S������}l�J�ZD�Zb��%�&�pCr�VC]	Gޟ቉#�K�g�"W�&q0֒r&�®�r�/m�HO/L�M��z�-Xڍp7�Wfʨ�G#�<�l����b�|
7�0 �~)f�k���I��#Xy��5�p;���oJ�"U9^���~�H~A�/j?��|=��$�?X���g�����kk�H!1#b9b���P��I���d����	M�})�
L�y�Nh�l�A�H������f�w�yX���B��"���s�'�Ҹq����r�%��:d����3�iy�qFv� �`h���f7��^.��c�C���Q/�L��C�����
P�g���7���H}�憿b���h#����~k'��~)vy݇��l���X�>y	���t�>��!V���L��^AP��
�p��G13m�V�joOm�ܶj�Ѩ�tU�&�C�7B���>�X���&2e�V�v�$�bGW��Lq[���M� �c��b�>��($h����]g;����<��y�o헜�_��[�!?�;~����_]���a$��m�m��.ibX-�h7���p�n��d-�Y��t���4�s?�{yH���(Va��9��w�Ѡ0������$��KA&l��xԹ�|����A��-�6��ℐ��X�`#b����BL����� -�4�Xec�|�%ȏ���/w`����>�Y!��sb��~g��N��Y�#ͫG�E"XO�؇d��4����Z6;v+�e��|YS�8c?�=�6����2�Kn�0O��3�?��>f�n$ʫ��Sb_�E��Z���A
�� ��:�!ʢ�	�7-Fg��W����=�"���<˞�Y��P45����R�ͭ�Q?p��(�j��y��f�V�Hs�#
�[g����}>��\�0������	�s�2�$>ғn����=���	���UD/���dE&��D
�+�`�Y%�NCWz����
Ĝ��?I��veYV7�bL�W��L5]�6@lE0ý@�)B���b��zQ<�*�mod�Wp��ڢ/QP$�LDy���)\k+��	;wլ�E$dN{��w߀D������;�o���o�/����W��h�dVI|E�1�8&�L��6��r�X��>V�a��Pfz�h�~�<9��;K�Қ)v;���5��ֱ�x5��]1��p�����jg���e�>��iq��}.d?��u�e	(k�ز1S��v���u$�k<�t�*W���J���=k�P�A�����{C�� ��
�����������ډ�3�����M�b�q��t����Ё�(c�,'^�=W�2���s�J�j���?�����8�窼`�cq[�Q#B�7L��Z�t�U$L*:4 *dTYn���z海Иl��[x3Nv�{���K�؜Mw&4��7
<��e���q����dem���l�n��E��4쇞������ѿ;}��'�(��y�w�o���w��I�J�b;���Eh] z�7+�bك��u#;}q�U_�A�y! P�]�r�+Enժ��<����9�����r��f�E ����-��e��I�b]���x��ϩ����i'E�<a�yD��HH}�!�͓=����]^�V���%{�Д�b�䵙W�)�}�F+�����n�/�Q`���}2�x-��l�����?3?�h��������^    v�.X��#S^�Z>P���d�*�Q��Oy�/�Mj,Ll��W�;�+Eva�*g��#�3��^ۅ)]bCj�w�L�@kl�/><`����g�F���3MA�7�ɲ62|�G�y�\J^�祑/�Phz���r��t�U�&�mZ�Tb_T�����g����^��V���g������ф���ٿ���w�a���@�L�81=���%缾�J���n�����R���tW�f��m�2�7P���*�
�f�0�q#	&#|�N�1��g��Hd�ʗ6��)�������0#5~���	=�V�(��tO*�F�j&d^g���S�E�׹_�������ؿ�_δa�����������=���r�*by`����'�w���N�\3��#�\L[)��KkHJ«�����L�5V��D�W���P�4�-�kt�i(�3����ԋ�M���A���O�G�:�����%��M��zu, 1�:��Hݏ�f�I���X�����:V�E��Å3��}��1o�����g_����+�������������k'H�ǿ��� ���l�|�h�w�Ln;l�U.H�K>s��7 � e-����Te�C�"����?���
W�+Ǚ;^�f�ȳ:�7z2�Էm���%�25+5.��I����k�5�E��*� �F�A�3`���((�zܨ8�`�M��!����h8��W/�Xy\K��� q�O�8�����﴿�3m!*�T�Nyy*�M�J@>�d*���O��/��[�� �Ø{�ݯ�b�z	��f۶jx��`�I� tN���Pbo�b�:�F����,�M��v�Ϲa{y4-�B���؅��;���� 뤬�d��@�~��ԛ�<kE������Z���b=h��Q'�'��]~�?_e�r���O�� �ϣX���ٿ��P��QsǶ���&xh����&�'��H��-��o�u��U��DO�)��S�O%��W���ٺ"tU��"��]�0�� ��k0��WZչY	�k\U`ˌ�(c���ր9��:�
�3�$���v	���n=�O������G���2�Q ~�şe4>��ʉ�W>B��J���[���i�n6�8��琻b'�x����:��lZ����0�*�>wz���n�f_J)>��& �5�T�������Z1����?�z��M�T�k2�Jg�AwC���!�����٤�(� 'ɛ����M��f�&MC���/��A��뀉/n�/�~jw1����Bk��NZ�O�x�i�do��4t2�&�8:Q��ڀ����(��i�uMoax&���4w�`6�M�,*�U�ͭ���`
Њ���",FYTT.)q�8��Q�V��:``79_��M�!��˴�?����t�49I������%��9a������f--�/dЏ-��ߟ� >��ܽ�Oӷv���i_r��M�4m�n�-�zF����apjUWн�wI�J}�>���!T����L��r'B��,}G�:o�`������&�D��~���o\��U�o���b�*0�O�:��;沫]�ؙHU$�&�K�StvWo�8�Qn*���{{d_��J��|a�S�/��0}k���i��+hM-�3�8H <�Y����g�G�u�oBH�es�+m��a��ض�b	�^�#���*Ȱ��U��'�RM���j�Ծ�6�b.ϵjUjc������e}�ia=�.o�P�A"-5��qK� ]��mD�s���0,����k����� y��o헶���^����пoȐ50�B����旱�� �A��/��[W��ȁ�/�S��>�����<Yۭ�j��뫽=�c�XO�RVA�h�����n�[F���O򖃿C��y$F�N!Ż�K[|�B՞w؛G��PD�n��{ ow�y�D?ei�
�����!�x\� �l--��㱕��/o���N����k�5i����� ?��V�L0 �\^�Yd@���9���V�f�ڳ�t����4�]"����H�-z��趫�LZ�M|W�ƮWv��hǟT��]��>s��Ewߗ�6.��A�T\�kqig��Z�D|�G�ؙ.!�yq9/|4 e�,�4J�� ��Q����q�9����SC��9�?X���#��+|Px���U����,A#�|�/���]A�eT$�#Ş��PY�a`s�Β�d�#����
�<qQ��,���u���~�1
���^��)!�ʛx�-�&��5�ֹ�^�4P��ueid��&��w�le��1�2k,Xw$1d ������a�T?���~g��N`�gϦ��.uM��2Ѳx�4�/y~�U�&��ƪ�M:Fp1CVY��.�"f7�W�G<�F	(Lw7�9������ͬ�Kp�`ܣ�q��Ŗ�zjeu���3��gxH�s����[x���Ă��d��ëR�  ��(����PR�F�t��r���G|y"������;�v��\�]�������򃲗��c�`�zi���3|.Z|��=D�^f�ζ���9����P�ՙ���hx�k����7�ENy�}�7G��ӥ�lG�@f����p�<��#��X��c�^|@���70Ⲭˁ�^պ������̽_�'s�-�?7l������[ѓڟ�Q��~k'�O���q=�;�i_<,ͯq�w�A.o�X�}���-a겜��d��>V@Šc�M�����\�t}��Z7/b�؛WMw�����6,���p񡋏�1&�����<#2o���-<�/ȋn�v:c�p4���2v��-QܜYpK?&G���0��8&�ڻm���_p}g��N\�^�Հ�+�`�Ҙ�9}��=R��E77����zl��]I�T{�u o��N���>�Qg�wgP�
7t�,��������(�-�������\�;�Ƭ��j��u��OLo(%|A4��[���-�b��#�CO/ E����]��ڗ�!�{7m���S������[`ؿ���j�|� ۿ��P��zL݃|0�+��56+ �%N�yMm��w`d�~����[#/	[�*A�	�2:?	�9iw�{��,�I�S����/F7�E 0@�V�Q=�ֱ��K�$�:�*Ά;=����q �w/�q���1������
�����`?����o�/��;U�G��GH�7���0:}�B�s�:^��0��눶�C�r-�G�_�{p�nw�4��o�䃋��l���mj��s��r�͖ˀ�����u������>�k���'(�����^4��JǛH�Z���1/�DG� =�ʶ|
ޗ�}��?*y�_��� �S����w}l�3�E;i}�GvM��+����h(�7����>��2%���7yPN���������5܃�����F����YC�''QC�1�&%�H���G���L=ށ$`��yIS��x�A�Q��,\m�ۙ�X=x4 �|���$� 
L|��g/H�~�뉚�i���Z_���B����S�����.M�Wʂ!V�%���MQ^�����哃}��@4w�Tx��˖��	T�*Zr�R6�_�3�e�Z�|�a"΃z 5�a���w0%��N��l����.?o-U�<1*�AY���l{3L=11r) �)&�3@�����*�OƬё*'O�HB��_����G�ϯ�P����g��i~k��N����N;
|�ȏ�Y�6H}��/����)F����2<	/��IbK�KRX�-��'���]e�É�{�Uy��t ��LC�S�	�:�� ��P�Ъ�ك]�NÌK^DS!��UiAت����e�.�Oj���nm�Â�T��tl׬w�f��H�9�����
g���� ����u�%~��o��w�>YF9��8>w�6�U�sM6�=i�Iy���3��y�dh�u��[;��}�+GvֆL�MC��ߞ�҃�5@�5*�����क़�<\��wj��:�pۃ�>!0+��v�!����G��-�����z��M�KֵQ�qIh)�=��*�    ���AWzni�0��KU���,��o��a��������� ?��\Ʀ$���<������W,A��k.	����\�u��mS37l�Xd���`+�['38���
'��쇅�8��=�_% o�|�z�E6Y�1�4�R����E�3�P�1{#�K$m�L��n�*c���[�2�M����Ɇ�J�J��p���=�L��(�W��Tv���8�v�?A~j���?X����M5��D:������(�E����"�h�Zq�G��N�Zb�xh�١�Bfn��>� xE��9[0;qO�늰�o=F��b[F8 �����$��3����#vb���T�W^ֺ�7肚�DKG�ʝ��lx��|�3�#d�����;�F����@��d�@�z�;���bDĴ������w��1#���o���w9�Z$Hy����&��҉�A;0��r�Z:yϢ��E�'E��#�UMH�:�1�}	��]���q.�AYw��T<�qg�6Ԑ���c�A�zP;�+T�Q�����\����%A�'�'+y+�R���-G�Z�u0���OJ-Z�y/^m�I�U�H�E)���=��L�����ȿ1��~�W���qe���ډ���$[x.:�m�Dn�Ka�4��fh+i�Y���>K����u��Ke��Ny�nӸG��;�7X3����uucOhE���0ӪB�o���)LTy�T�z3 �3��H�"+4d��V�q��q.�#��T|�e�Ri�G��p� �
�䓏�$�F�Ǒa�Ɵڹ#�F�}t��e�?����P�sC��ǽ�k?��p��'k{DB�$�iN֨=��"u��ŧ���[��}h�啉���Z�Tj���\����qr��L�zb[ݓN�W�.D��T���(�P�Ūb��� i�68+;/�G9�h/��a�b[�Z$��!^k�1��^�/��Z5����§��E��yk'�O���Y����0B��}����H�_�)��z;���)��)=���0Wyʜ�>-�e$��o�|��:0�5��B���5��ܖ�D��G�(T>pX�KQ�ۅ���Mv�׹�=KL5z�����w�Uj��`�����6�ep�Gc$�������?l��	�3�)SI�>���.��i��%I��m����=h�g�@�@�P���@�Gvvw��~{O���6[Uɕ�K�/w'�,!�>���x'��A��D�C�(�n��踵ى����SH[\�[�m-Mz���[@��q���M1��uX'|���\r
��ܬ�""�=;f�h�?2`yW��O��3� 24��E�}7�Σr���-]��Ilr���`6��0݃�F_ul��e�?J�K��M��3�7�/���i�ՠN%O�j	�S����³�]=��%Fz{�dSS:��e� b�7�
Nm�Sw/�T��!�+Y�A��z���WU1<$;�<���,���ʬZ��ܹk�.�@+S�[A�u�HsdX�P�A�:��~�X{ϊD��[��ͨE{߶zb$��L�ڌ,�NU���A���������&���ׂ�̿���g�=����ه6��O���טRƀ@�o"��NxlM��D�љ�/'�N6d+r�qj�󒵫�ԨsB�~mE;'��1Tޣ�'UJ3=[��a�.�I�љ��䡼h�DgUؽ@����9�{K:E[���q�poXz��=:���������c�Zmg넽�!E�Y�p�J�������#G�{����K�@~��4�c�dC��ܠS۷��/!�y�xH����c���rP�V��( e*������m`&6]���	�sZ��5�/q���]�����"2�s'%���-��r'ݲ��3#ٴ|=�c�:ʾ�'���%S�P�>F�����+A���=K�:�F���-Uu��I~ܥ��	��A"����u@�f��]�\N&���9q,��ܳ'����V6} ��������62"K-2�4�)#|z��iɿ3�x�H���ˑ�l|�{R?����6K
�"�'��TB�5�����F��9A��)�Ňɗ�^��K��ފ�v�gQ��u��<׵�³~k�����=*���i� �vU��p�?.��{���_�Ok���/���B#��aА9v�N.����j��(p�Z��s��$,�y�5\c�1��M�b�r��Z��
�ܡC;�dK�զA'��A���M�w�J�=j�v퓍S�RP�B��0���缔���7���'��hv��.�\�n�������p2ð���<ݎ� �Վ�}�V���4� �����w�/�?(����T�̵^@}�F���W�@�)+�3�s,�1��5R�]i��g붙�ϕ����pvL��=�26�5l��AeEn�U/�{�@oflH�<��d���;�`�qnx�ŝ{f��Kؼ!<8v
�f7jQ&Z��
V�ž����0�hf��^=��;|X>��(� �t�m첿H�����8���?�����K�8~���8���h�z�eD��gZ�R�;}��' �D�Kؒ��{^(��w��l���'��{��;�<s���5%!��A���g���:��m:R-���1A��N�6��,E�o�R�r�/+%�=$Gă{/>҉�Z�$eM2-2����6v�KzhN>�J��o�-�������S-�G/1}]�{i���g���eqį�����vaD>��%kZ����U����=�g_�z�QzԂ�*�b��#�DB��6�Nm0�v9��_���fY8Sc�h5{bV�9d4���֛y�wU
VR/��ff�z0"T�������54D��ʕ�%U��+Ӧ�7En����[늺���b'UD������#����W���va�|�̜A���u�G���Tw��6�v,��"��!�lD�(%K$+'�9�4]G�!Q�y�5I��
�B�2����A����q�#	~F"��}��z����m���M��,�Yٻ�U�H�J9��Z����ƲN�U��bI��P�'r��P(��l�C� Q�İ�iQZ|��~ǈS�+F��N�0~:�V��JEL�����^�ݚї��%*9F�`�P�
�8	Qa*vɣA &O!�y,�t�m��� 66�j�jbԟ��G(�1��S����Rwf���#dc8��wC����ԹQ+�����ޮ�=�����'����w%�������_?��)��_���S�GH��~g��]�>C�i��#b	Ҿ��PˍC��>�|׼�x-�5P�#"кf4<��jx�� �<)V�PM��Od���-\�8�6����)��>8�Y����	U�+Vada�BFP��A�G�1G�5��O�����FjX��h"%a��Z0t;��IV�u�yhB>;�W���m�}������~
���Mz�`��] ?m1z�����|��Z����G��s�IG�vAyDT�N�yN�Vq�@���KF[V��,\6=�B3݇rU��I�6��E?��yd@�Q�ʊ�'�exfz�����Ng�P��">J=x"ok���P�us�p����X�=��HI�/��
���S���/�_��?���i]�׺'5��i���\N��#�^0��Z(�)�G�2\���gcK��K�#3�&���y4�uZ5:������ufI=�h����i!�Ȓ�-�oW.j+��Wd��L*��))@��G^}(ϵ�p����[=��9�T=R��$��1͈�;��kĴ~B���>�J������������6�����v�����Eռ�~*x�/�-n�4��^w�E;��n���6I���5IVv&��ͩn���#{���Ɂrrw�8 �qaf�$w^��7�kE�,1M�W�5����T�A
�������������L^�
s���t��|�/P�봊?d�,j#1�3󺩻L�� �z�'��&���@b�O�X����r��� ��v��n��] ?�p��3��Uf!zg���7v~ON����%a�kcK<mf_�]�4L��8�`�m�)�c_,������]�kNebP�K(X    2/bᡙ2�T�y�_`r\��ލ���l6�>���YM����mF��vVoɌC��h�0���+_���+����}<��+�?��fk�;�/���Y���ѽ��Td�S�jN��"숣�1��2ǠD�b�*H�zL��4=a�~ma������v��re�牕���'�6�qa�O;�m�������="
Wņ7��j��~R#n�mkN_o���w�s�E �W���\���"������P�?}��q(�����v�i�ωm
�U8�.Q򦞮��m�����Bo	%9yd�����,ޏ3�l��Lv`�������X���k8��ߌ���-y�\(82�ݖy�G�_�$ޓ�k������Z0��0��g�{��7+����Qr�JY;AO�1G͇LUe�ua��ȍ��
���[9�4�Wo��$E�B�S�)�������K�@~§C�۲K8���0�N ��Dj���g.��:����yK%��:��bh��nV��M��\�*tl��3*,�*)u�|PJz��>WuN tY�T��*�u�¾_�mN������G�*�lw,��n4����H�H�";�I7��qT����|gD�C��)�������e�ϓ�/�_v�����.��I��c'N򁤻�{�{Db��儤f�ג9��<���E<Z����j�b)#��cNДM�HD(8mhr5���I�&I*k��-������]]�'#J�3S�����돱e�
`!��-=���z"{,g+}ߞp���z�ЙE.���=��ɰ]"�ҧ��0F��_����u����~
ߵz|g����?]�e�}h�|�XYk��,��Ӈ�D�j�Ԩ�J���œm�5�WO��Y?����<b9���O՞̘`�W���&�V�[s#�=���,��y��Zw�����r��\�a�$����B���D����$�ޙcx����F��`.5�>Z��M������(��?��K�:�S���߭���g��q�>�լ�26�A�hoZ��[��s	��Q�����xYVY-����"�Lǣj�)�6U���B���[22P<�*��פ*������]������&z��&��Ct��ZuO ���k�"�~*U �y�=�!�� �Z3%EGCcf�܁Pb�Xo{���3�	��%���?�S�K��i����va�LaL&�s���Z��8*����� � �x�ʋ�y��ڀg�0��G�?qL���T�0� [� �s'�k��=�_A�oF@�5Y7N�}���y T��3d�Jy7e�Z�j=��U��F^������m<P'���$m~��Z1���p� ����įC�醻��o1��% �K�������Y���K�0~�d�����Q���r��JL-:��w��|g�m�S�6���}��輢��S�
�R�G�|;\D֔ù�4���u�GZ� �����պ}r��>i�LH��bFe�J�2�No���˴����T!��r�s�a��#��w_�u�[
\�5����-�8�.cc ]��ш�Ǿ��?1����s�=�7)�w�_څ��k��`����4ٛS�E��oC_FD��6{��!��l(��x����>.8�G�R�5/&�_}2����DR���N$�`4^���tܧ�K����i����VY��D�3����8��b�'5QHu���9�;��O����O�k$�am��U�`���6�&���ƿ��GO����OH��_����;�/����D���1(��x�4UWQW�Y�Dq~0�i<���SD[�����"}���E���mG/\sL��"f0�����2v�f�rψ�C��՛��Hk<�"���%X�
���d�Fo�8��aAO��r_��� wÈ��o�}x�����~|��+5�j���1�(�ȿ���Yi��68��%��{���y�To�=�Щ�w��*S[�/�޻U�mT�#�@�Ev�����P��yn��P/�S}�[�1"�ܼ	�8��;�,�ߧ'�p@<׽�jR���S��S�?��8�Zr�z~yD|�qs�2�G���D�Y�p�Mf@V)����D������q��~����/����"���G׎\�Z������^�o�bH"����e6Z �b��s��P��#�u%7Xw�Av�(Rr�� ��R�4�	U���n�~�k-|Lꔅ�ó r�O_��1.�[
)�	8��-��V�Wx�:�4��[�'Wy���O�t�`�O���>������?X~i�ό�[3�F=�ogE|�5��ma�HN�ꡎK��Љzߞ�K��NzH)�F�V����<�ם��.�7�����GI5`@�beC��^e�v�7�$kK�I]�;(������;D֭>�bR�|��&���q���\y�i�B��wNj��X���H��r�h��@7��y}4�SuFi9:�V�'�?[i�����gI[�����4�����@�����Gq���;�S�OV�v�$N2�u
��{��q�A3��;K���y�q^8^�6��x������ �`{y3��R��f6l�f�Z���I�6�hH��<�ʈ!2�f�ǉ�1�U�d����y��q��]���C�����v����	��qBIk��g�x���#��Dk�|`W�}8�W�K��9�=䬪�Kzn��9s��{��0?��g��
�}5;�wK~9�Xjuҗ� Τn��9�A��M�t���鎼4Uq��]2j�]_��Hy��юA*��̃_Ύ�qtB��H�mPW.�e��~����??n��_ڿG�߬���_�LBs7 ��{�'�'�K2�� 箔�����dCqGBZ	�B� w&M�zn�ѽ��* )톛����Sf�B1���y�vʭ��{�'�n��{Vp�7a��1LJ}��{��̎S����.s�����o&��CH�t�E��V`N�E,��ޯ��=���~�H~������w���r����.�N��p�=M�\v�٪:Xu�����3�{����oBmV:��A�Ѩ:��O��i̒�������=�S�Ej �P�³�Ǌ�7E�{���ݷ%���ܜ1^"PĒq���}k�4M=�.�� mv s�Ҷ�0�GH�ʐ�#�!fs�,�^ ��&}췟0��R	
��%>���[���U��T�ߘ��]?���vt�d��f52븾y�B8�^~68R圷��l�GY����\ I�j��PE��Ej�b?c�W�E�S��
�J󞪊��n��2��V)�J�O%��&&\�=��Y���.��}��JX�晩�Q�s�Y�sI�*z������4��~�\�,cG.�?V�Q��wa}��N��9~��9�ب��]�\$�8��`0���F
O�)�{�Eậ��$��7::3�	�c�F.R���4UK�ao_c8D�U?�W��)��O��
�
"f]�f�HAsm"�y%�ҁ{0�0Uz�)�$��~�{S����ej��P���	�H�k�/W�s���氁��3��:�E&o���֕B�����=fsD>/A�_8�d��vq�L��Q���u�A��슷ѩ�������O���fzg�:�z� �#�� �c��@SB@�WT?
���U�|��_w=�q�l+�J�U~����u�Ӂ�YvIo��{�Zȑ����ئ���r"�;a[�Q
#)��W))�{љ-Ww����sW���t�n�7��q��O�h�ǟ��.��>u~����|�Ҡ�!�w� )�G��lM&�4l��Q�8�#�.@R�^.��:� 9^��|��V?_H��;��R{3�ICKW�ʹ6�ۛC?�n.'�j���Jc|��z����j�u�?tQ�N�Q��܁�T�2���J�#a���5x��^�	�޳�rD�h�����A�0~������n�ѽyJ�e���Cq�ؕ��`�kE��2Z�psZJ�.�-(�Ɋq��
N�r���w2Z�xZ�Ir�1,1%�wbo����Ib�    �Z;zÍ���$�b���r�='�f���,�� L��w�^� �(����W�\��񧏣���?��K�s�����r����?��"f�n�%�苰k�	Lh�!�)��%�c�@�f\��9S�T���L�x4-��%[ڢ�pc>�x� ����@�0dM*���)�U�.�i%O�x�&3r"� )�W��\OA�"b���ުxɄ�ɮvM3�&���Q����Yp��o�~;��ZW��0OhD1���b�G������~|�ϵ����.��I"��A?��
V-S:�u�6��%c�J�w�fc��Kza7�N�\ߔJ���d( ��p���M�ې�v�s�I̶JTʺ��f���W��i��P��Od���������M�CMmq��}�7'�%�(x|'�u;��|���u|�Ԑ3��p/p�(ޝ�h��G��)�'H��W�� ���.��s�[��_w�ǧ�<kIS=�4��{��+x L�tp2�R�����d�k����hm:$�L���kehn2©k�#)ޓy �zS�O�Lo2D����<�`&T3���&b!t�2�gh�����T�|�hT�]ǿd}>�[�<&��3wdR�Ցe?˻���*�m��"m���YZ�����u������K�0~f���	�^{��Y��,���7&��� �E4��z�wN�ż�¯i͇}"-�vfA�<�"u,���m
}vRA�{WE�e��Ka�u� -��r�%�k���q-	��`���b;��\$�5��jn��a���w�2����c����N�@zrL �A|U�h��i�`�_'6��$�cvi^�G���h���K�0~&7bS�PD�Ȣ��hR���m�< �)�4��@D�#T����̲��I�E(��n�k&<���?�j�V/�����|�C�VԈ܉q�]Qޤ����q %쀡��R.@�����Y�FYSY��N?�ȯ�=Hj���b&�$��<w����j��A���_�5��J����/�sZ��GW���#��`��]�?��H�V��=A����n�����~lڔVq���e���Y�>��c��w� �)31�VC����0�%��"�CC{
U�O�����v���� Nc��E���dIp�v�n��5�ֳ�o#�Ce�ַ!W�Ҳ�~		L�7�+0t�>ɕ%�0�1{���=�:���
����?q���K�8�v������a9�g{�+�����Oס�N��w� �����V��ʤaw?��V:tTV�o9Lab/�m �$]��������FA �C�ɹ��@���2�'Ɖ�k�PEB�W��Ƃ.O<�8D'aҧG�Y&�$#0��Y7Lt��Ҥ��d�i�"�yl�-��#F�ؓ���S��8�b�����a�;,�nr�T��)8 ��d�a%���xz:!n�\���}[�y�v�Ѓ՞Y�,����Rb�ϩ��A�rh;@��$��m�l�����Q/���̫�������Ȯ�́���A�o'�U=!�xk���qGd���=jF�ü%v?��
ク��Gw��#������q9��A�?8���xe�7GL�5��.��6����3a�A6Ic1e~Y��� �i]��ȝ������-kp���t�Y����Sb��Dl����K=�� �)qcv]�a�p%FTۄ�c���x��u,��g����l�A{�Y��*﬑Ne��USBx��)ORzF�ٓf�����Zj�k���P��%����[�M�|��S�7�ߙi�����i�����n�<����^x����o a��?���ó2{�N4��"���#�ҊǙz\'�~nң�M��L=U� ��n�G�?�����W�u@CN�Ȳ��3p��i�\�bl��O���{�)LD"ϥ�Ϳ/��ɗKe4!7�u��VV�>a#y��J��+�iQ�3U���|������7��.��iO�$p������u*�-� ҥ�e����9�1.Hw��Y˱�@����NMI=n�"J)g�u7S���=�'�e����$fI���TSY�c%"@�3�����d∩�}ߍ�;[Nj��4z`C�ҧ/����8 #���NjaKG�����Y^ѿrD���b�'ǿ������.��k�W��)���{d��haR���w%&�WF�ŕ�MR�w�<�E�83��1�����p�C�زl7���cE��H�jR��-1&��h˫IS�*�
��]a��/R�h��j�����Ȧ���~j4�̊^��c��8u^���%�2�M�ݱJ���ÔN�2���\d����݉HS���^շ�_څ�"g,�x1r^������
��d$��n�`ٱ\�:�E6"��"��YLYyn���f�.P���O�
��uG���
�A7$/�(�jL�׿#�C$D��	�i�u^'ؒ���(�x>�!�r�r�L�i�`��������(��&������ii���y��[�/�B��)dxH�9�![�� �4�	�'��R#-&��I�j��ڂ3h��m;Z���Y�.ߞS/�E�O�yv���-����-�����sC8�&�徊M���
q���9z�fS�WA9D'���l-+���:��ޫyt�ɥ�kp���Mu{e�ͬ�l�h��r������hh��nq���ڿ;��Ϳ���g�M���;���a�w�%�������K�&�;Я���^k;��в��d;�^�.`��=��f�@�/U�~3� &q)��q��iMk�&�)����������2�"�#4�bX?7b��.A���E�0.M/Ԭq:�^&�բ/�NE!]sI�����A�/?�;�����v����<�ַ���$x���T4��-a1n`e�)p��88�����y�2W��S'�~"3>{��)	,Y*s�m�Wܴ�+|�Kޯ��~�o��'u<�W)�'R�m��+c2g��H��2У����d�0�{6�!֋9f7#�{Y�����+	&~���9�T��#���"�#
��~�M�׷�_��?mJ�h�P��P#=��Vʌ
-�D���E�Ca��伛zw���sh��⎢SqL�h*	�-�g�
)����̔����$s��F��*��%�?.'3�-k������v0+xR���������۞Z�e��޶�� z��|��q�����t:�]���K�~�~���š_ڿ��﬿��S]Ntb�[��w���J��CT�&�����>���x��l8v��s�}YL��x*/(�4��%��R<^E瑡�t~�r׾FuKm7G���ڎ� ��]���wU�=�`}7G)_4��X��sDB�D�{�i@a]�
U`� ��I.��B&c7Y��R�l5���#�����U�׻�/��~����o0~g��]?}j�'U���3�8����i|k,�(7�]=�}�2�CM�q �5νb1�k������w&���w�L@�R����*��;=Uo]^@�,y�DH�|&�Sd�f۾G4�,:G�tߥLyu���8n�ݫ�� 0���Us�x<o�4��HO0<��bJ���Y�����`��q�ҹ��~���zh�㑔o��w�_څ���)��g���Y^9�j��˥��bM�n����hb-�֜~^��<m�T�+Oꓒ0Z. �Y����yȀ\eD?AL8�vo����R^o8񌜘C����^ ��]Ҋ���/�Mۇ���V��b�d��:�qj&�P�{Z�RH�1K��<�9�F��#�>�	��QF���Ӓ����w�_څ�ϗ�P�{��"�P�&Q��0� �VwT���˘F\�#^-�>�ZV�v�$�
���`C{gu@,}�V6��$�/��� U��,�$�����#u+��q�頸�+�4�߶ާ�S�	l�T���p�*�h*w��EŽV���	�����K�Fې1=4f��/��~ǈ�xMٟ��[��ʳ����;���K�8~�+zy.]��X���E��dKl_\�I�?�U+l@HD�1,���Ш�J!'^A     ���M�W�@{���{��c�+���+;~>�zNF���"j� '�%Hg��������Z���J2����@��!��0���e�y��3��X�]��&�P�<�@��Yڻ?�Jˬ�[��7��?[i��z%m�
^+������M8���4�'yן�c�q��	cH�K䷇��"œ�^Sy%�,�����K�.}�O����*	�x��o|�^I.��Ί��Z=�����8�+��m�2E��c>����S�^A!�UsK�+����nZ��~<'w=N�����mA����ͬ�~<"�7F�����_���Q`���a21����[?PuN@FZC7/���G��F�։+!=^-�Hf�:R�2:�x�
�D����q�,����ŕ�bñ�x�L�$�e�&�`�#m��J"�<�U�"�j@R#f=�`#:�]�}N������k�БW">z�L�y�bД��������հa�����?9�?^�נ$��f����.���L�⑎O�����Ыǆ��B>cb'j�	�)-2]<́чZÝ2 A.}�M	�E0�pe!0�N�t胿1 f�7�9�~S�������+��I>�F�a�-T����iQsr-��0	M`H����
�Z�!Q`=�J�r�A�㽜ǯG���@|i_g)�ߏ=~k��]�>�*��:LG ?+�9��J|]���$�mEw%n�ˊ2�o�Md�P=�Z�(c�^�P	p��dq)�(��r ��uy�W�|�N�/;���ul���o��5"cs�9b���6DW�gFW��fZ�7�:o3|?^�����f^��6��!�曤%�eFZ:�S�|��(�Ͱ#<��'E��?����&~�"~g����>���U���	��1�`��/�ڌ�\N��ڗC�!
xR~s��e���*�V�����Ğ#!K�����/�` �֌S蛃0r����t�	q$M��_�S�G�{�|�S!T�v�n�'P�����,eV-"���]�	�`|%��yl;��\F����`b��߿`��v�Rc�G�k���w�/���Y�T�}ŇK$LF�F�cz���.�F\�	�+m�J.���kS���y���:>�iPd�Te�w;�6[c?<s)��{���%�V1C�U��J��#֍M��%K��}��׹cFX!ΜZd���vГ&\�}"G���q��=��]�+xQ���T$R����|��]B���;F���/?��O�^�������K�8~�ͫ��|��j4�U�����Br���Ӛ�rj����*�RV��W1�~lO��$u����E)����mhRF�e���������:8���}�	�˔�*�x-쒒̤��v�,7����hzH�T"�LJEaQv6<�F�𔗵bz�0�9DC�ᗠ���c���K���&}u� ���7�/��i#���#���)�Ï:�!fz��N��m�cO$���}\�x�=WSީ�_"j����5�r��{ggS9��̯�:�+|�O�tP����B�Veэ�u�(l��x`���\��ofge"odgg��҆�&v���z�	s�HC�ù��Q��a%��5�C79	������������/���Z}�$��U��Kڰ�NU�.4_ȭ��B������H0E���q@]�� �2��6 8A"����`L�{�Qg���6i�1��t|����p���:��+���ٻ�'��M��yP[�����,-Ȅ��F��Y� I�,!,6M�#��A���v:�ṃ�;s;��7�(���� ?�w��Yi�OgЋXl��{�neTގ."��^�%ꪧݙ�5g�m�B�1��E�7�z�BP��6�PGy�v����oT�g��}FY;1�x��Nǀ��<0����	>	�+O9qq_��dt'R���X��;�6i\Aqΐ���
N���=���w�����/hi����e��Cڌ'���m<�b��] ?˖)�A�����O��� ���|3��.=�z�驤���&_�z���KD�!x[<�ȝ!V� {X�3�!��s�XID�I/h�L3�)�|���h�Cs��NJ%� |M�l�R^�~�(Q8u�$0�C���ȡ�������'�aB����n����ݦ��Jb-6m�,?���w�8�K���������K�@~�-���>]� ��^��=D�5�����P��j)��"������r�h�^ �^���=!�a���+�!�N�=4;� ��|� *�z���NG�sa�W�<Ś����b�����U�$Q��bhk���s|2kD^M�+���a�#��3�aWu�͏ �}b���g�"�hj��O&މ���46��U�[�܉�FR�#^Ѽb�w	c�>��{�qa�n��A~��5�h�����m�h��n���W7�N�A�'0����0�|�+(C{ī����l�o#�7��Ab��{yR������l{�����֭c�`r�~WH����V^������/J��!�&������v��,i�[�ou�����ͳ�U7�B�����=�dp� ���}�ABcm�>aDJ���(������=�M`�X��@� ��g����8��Kώy2":t�) ֛H�	�/<cL��W�F�B6��xney���=z��爇^�~`��\��Y�>���ެݸ�)���w���H��b�K�@�n������I�η�v�e0V+/��ޝ��"��������<�LYou���iÕ��:�E�c�Z{Ź���P$4ŝn�'�'��V�	�lD>��5��BF}F�dx>[�s��7	ʸm�渪Y\ݞ >f��7�sײ��?/��$��u���@{�7�ڻ�Q�x)~��?uڐ_����/��Y�8��@�~ ��+΀�"}��#���[�s��{�&G�,lw|�W�9�qgx����F��/y�N�2+��3���7�*�G{/�YZ��Y��tF�p��v;Fz��%��K/*D</�K_�]DY��J�k���d�@Q�nѼV�3{�g\� F�^�b�\F�bh�0���h_j��IS�7�ϊ�ci����,K| �.��MW�kS)V��L��"N��� �/�>A��+�_ �ٿ��g]c0��5������X�|V�)rDO.Gn���x�!�=B[0�3R����UHh�z��iW�k�im�ځ*�u��x:H��#�<���!`����~�Y��
i���,8;�${nH=?=ӥN�n���p��15D����F?(��p��v�\�^���v,�� ������o�d�?Y��㧍!�;�݂��4y9��qBBͯ�c]�Y<?��(Sc�`L���#��4�P���4�Z-FE�7�|���N^W������BET!;�ث+���5m"�-n�5~0t}ԉO<廒O|�]
)g��
�{2%�t���8٨<��&W��+��y
�<�A��1���4�־iB�@����� ?�q�rʑchC��[�Y
El����@�N�̵+����D�pe�#j�tૂ�lL�_}n���hՂ���a0-f�j�KVi���>A�$4��D�V����
����ъi!Y�:_��I$���s�~��I��C>��u����F��|�J�&G�#�rHF�|5�Z���=���������� ?��ur��v'@�K.3���?dK�sX���45�b����q�U���V��ʝ�Ĭ��@�]��3a�Vm����W�K�<}ş|1�5[�5��u�1a��ݦ6V�(;���d�P8�󎡰}\���"�;��a�%X�N�l��l &ҿ?�ǋO���P��z����W.?پ�֯��Ѕ�F�$kU�w]'�)�C#�c�.��#��8xp}H�8JpI�4��i��ffu��#DQ7q��l�(#b��J�<��>����]��]YҩR�FWC�Z��,�y*�<lO.�̒�L�l�A�&vZ��r�k�e@}y��[�u-��q��������u��ߡO �ZIN��խ�    ��	2����R1^̄ۅf̩n���V�F?�nK����>�+����7����4 g�g�0D�J��ȵ�>�Ɍ�UVP(�|H�K����G|��䝜�dHVN�e�䝫g1g q�	(�^勡��d�W�J�~>�e��f��/�����ӿ��_?�=�~8Q�������Y��c�􏆡yĘ�ө��$; ��l��GĽ�D��$�q{o�3�XG�����W��e�ymz���r����e�#>WE�iW���Q!R�@��toPB���=b��u Z��w�$�C�?*)��AY�d�Һ��k3�e��]�TwG�Rl�\o=�A���v��;Ə;w~�=_����}��s����o����`��
����&��M����;>:���Cۛl���'���T��1��=���� �vi�25�tqw��@�}��C�;v�ͽ�Kr%�эLɧ�G"l�L���X&î<�g�K	2�fWw"Ü��Lu�}�Y ^/�= �!Ɣ�4V������"5SE�	��}�/���(���[;A~��M4ء�ʴ� �����ca�i�s�_aH�,�f�W�.��!C�>W
�V��ū����#bF�n�ʳ6�Q�����+�̺��>���w�uŠ�՞���
A�![��W��^�@J������
��Έ0J�AÑ�q]�Q}^�H:\z}��K_���,��;�5���@�����[�' ��k'��-@��e�� ���*D���//��͹��o�Q������(˯J�������:�Tş�$.��c8��[�iq�"i��L9��ېZ���R�]ቋ>�,f��	�9Ѓ��zu����fQt<�8by=����Ёz_R��@o����Q�&�F��L��k�FA��GIF~���3�����	�Ӧ�7���Ez��X$hpK��Ƅ����$�?��}Z���1p�i֕1� �7j=R*�}�i�W*v�tg�KȀ���d`!V�Ef:��d�f]B{�޻<V���F�l==5���@T�j��7�VK61E~w�{���~w�a ]5�n����Cx��hYWӠg��P.��}98���/��i�O�o���Y��(��,�{�!�M����PwW�[��~���:K>��E���,��x-ܙSѓ*nˀ���C�G\��!�k��hl;�X׌_�+�^U�H���L�фx{ܘ��B���ɣ�ql��3,U7%��~�����(I�� ���b��_eO�a͍U����cE����[�'+����/��m>�AE-u�"'��SI�q]�W�̓A��{�+�"�����q�ҚE�6�qu���Mސ��*�t�NO�S���7������Ee���L��Gߎ�}�Ȕ�PV�2��c�'AT�;@�{0	C���zEC��VD-A�X/�R����s���>���-2�����O�������[�� 
�uA��I��o������6��u��E�j�D2K�X� po-�鲛�to� ���0�8V}@v��ÃJo
����}����l�)��M�K7����us�)�h��M�·��8��њ�s.�FrZ�	)+�|'�O6���rY�癲n~Lٰ~�B;{Ybg8�B�O��Ϳ{��L�%wa�.��/=��K�F�������svď�o����4���&����`^m{��=`I�Y�� ?'��	\�B�>�	���!�}�ǽ�KR�h$)w�uH����Z��v��R:��ô���u ���$��fC�yh�v�rp����^���_��O���z����JØ��1�Ty�^�~��o�1��;�O����C����[;a}�֡3�V]h^��u�q�P�����K8m�S��]ܾ���Fۜ�u.�"���f�tn7rD�W�����1א9��{�����=���`���&�{�rӚ ��.��-J�r�p�L?k�ʤ�w�<q�\�@$/����+l�ɨ��FX�V�㪨��n��^=������#_2��O7���[;A~��MY��,��`O�7��bW�iQ�=}c	�<�A*���1�{;�б�/M�yĂbE���[)�\��Z#*g�£W���͇u��%i���G�rTY8o��o��^�k�QN{w�Z<�{��ꓸ@�v���/V��/��zX.F��q"�i5�	J�}8��z}ټ��O�þ��Qoퟁ�f��N���8E���t��zf���{�͚��m����'���h) ��ض�mMq�m�O����D�C��Dw���
�C`� ƻV��'4��)Z��Ӌ�ݭhrxD�������D�ڣ��a�� ��τ��M�l�^�8n��Z1�W�e'6���𠉶��?W$��/�zk��7��v�����/�c��й�t�ڠE��B��
�|/@�~z���г�e۫�ih�D/ROBpk�(Q�Ul��xfӘ��	��-�5w�Ҋ��6y.�{d����L���p�7;�����ǏE��<��X)`�$��z�s.dS�BP���)L��x� ��oY�y)G������}k'��%��2�Y���]#�:�Rt0��{\5�l�����[a���æ�|���]�K?��1͊���	,�^� ��H����0-��<���w�/�uzax�V0cX};���ji_�>�uȟl�SǓUB�T�2|%r*�yt=s*����A���A���bu�e/쥊��o_��_�����OV��o��i	qpa1�&�g]Njp��-4��]�3�%�	��~����Ę�%,4���틪��K@�̙﹓�Ψ�ss�0�@~�;�ԢAz*s)��([��* �Ҫ�nW�̍_�3.탦*QE�u�+����8Wp�D��.A��,sZ*�9�����p��N
�y�� ?.c�|���3�����	�3�,V~_��Y>�_ʬ���9/S��R@D���,�$>^T7@`�D�Č� �U$?7�X�| �Xbd 3����$���f�`M���9��M!V�#I��>�2<C}�.0��4�R�|C����uo�4ii�M�Ы|Iՙ���$�hL4,*���>.���"C���_����i��~]�5ex�*�S�Q�
�iZSl�z���2[՗�?��Pft7�DB���'��,]�e�պa[��V��f{���s��B���2klX�����3�4�f�x�J���hR��B�A�p��(����༸C�H
`��U��J&�aeS��%ƥ�l>$Y�Y�
R�6#�5!�x�����{�}��?r�n��vr�L�Ņ۰stt�&W�FF��>�*�/���W�.8�i�������8��r��1��!Q���P��ϹW��z�	�� ��с� Qq.�94�y}��d8�ڒ(r<�l��K�>��G��ʍ��Sr��r��R�V/��έ�[�����s�"t{�-W���`��߿& ���yk�_���OV~�k'�O�n�=/�L��Җ/�3�XqE�M�R���Bg/��>b�����6��S����w�%�Ad����wp�6��S�põp��F�-�`i�S?KE�ۏ���2�2��(�//w"�DVNlNZ_�S�j2�Ikk����Y3��Ȅ� c�2��ҫ������ı�w��v�������n�389j��ɬn4�z�
()�b��tBG�=.�JE���f�Ly��m�?j���CT��m|Z��Z�Uj�X톀�4!��b�{�ćp+[������)�=�sy�N��t���N���X��.�-P��m��ҙ�#�����P�,ׇ�v۟ �l��/��o �ڿ�䯓�y�	4�(��᮹�#�h#�jG��L�reW�9ڨ�y�ڰ~�,�D���ֹf+;�k�5=��ġ��!z��L�N��A0bО��X�鹴��-�@F˳#"�<<�� �
��� d�`�>i�X�=�ڜ@h�[S
WN
�����H^��t�ϒ+c����� ���?�Bз�����?����ډ�3,�EbS~��'����%���RYz�G������    �$��}k��m�m��h8]�{Ɩ>Z���gMV{�Y�]��yU�EA����� %JS��WH&˒�Bّ⨬����f�GDu7t�C|f�nch����H���ML��
z�$Z	��F�5.C})M�-����t|���C#��������#r�7L�h~�~k��~]=��W1PC���K>G����b�n�J(�)4B����@�%		-Җ9�j/kO,��u�mŭ�=B��/1���S�[.~X�Z�P�P*S���p�3�8f��� T�zf~LZ�Ar����!w?z��l�/�&���g���W)�a t��J������&�#��p0W��'F�����0���������G�vb�����$^2W�΋8�kr�'������eki\Э�gqH��H!V�Q[Z�OQ�9����=y�q�4Ҁ/"�xc� �4W�l�[���zeƠ<��8��gY���:t��,3���;|׳D�� @�m^8�H�d�է���L�w��Ԛe�f����nC�d��ş��~�}���S�[�_��ډ��ȰH3��`c�-��?c�EY�r�{����	T͆�y�>}��묯�x@��u=�ˉ�vJvJ'#��yx��j��}������ba�n�^��sU�g<Ki6r˶�mx%ٔ���4�C�Xr�6<���k��N�F�P��a�D�Q���ox�*#��������6����~a���Ư�o���ic��yk�˂��4Mg	{^�Q�qrzz��jf+��x�;jya����Q��!�h����e&Qrn�n�~��Q{܁j�I]��k�R�طm�/���e"�9\����Z7*�񲙇%�׳)���nLH.c,�˖VAA���żP�Z~y8���m޿5��7A���w�9��a��NZ���E^�?�y���e���؞#;)+J��pӒ���k�&ew&��ئ�[��Q�bd�k�!��>���I�5bo㭥�x� .�7@�x ��sj�^9ۑ���Q��h(�(И�e��0h4��Q�o��uk�Yzp�r�v(�t�@5G�w2sÿ�Q�`o���������>O���F��p���fݳ� j�0�0���Dq�(����Y��&Ȥ<�
Ys!��ט�Ic��	�
��q�fӌ�mh��*#��X�Kj�#�޼P�Ń�V�����'"�B�D܆��58��qڟsl��X���]����([���i������`��s�OZ��?�������>�`:<%?5�~�|�#�%s��ȼ+�̒��{m���!���1��,8�ka��/�ޥ�c�%��Y$�����y~�p4�?ݛ�� �N�!M��BE���A�>xFGӝ'<�!<���G�tU�����m�����g��j���p8�'�O���h��NX�)G<]ųIe��x$�]D
EH��`R\���g]%Ccj��ᨹˁܱiሬ?���<ػ������bʂ�ԛyJ��~�%��v!I�ɮ 3�Κid |�F��B���"��!씵�f�*P},�#���g�u�=!}F�nL���ӮP�k���K�T���ѿ��c� �G��;u>s�A�i������d\��
�a�4�H�~[�sA(5�p�cL4�. p�t!c��TBc��UϦ�vPV�$Փ�}ơ2��~ Ԙ���^r^�U\@I�26�'(\}#I�f���Ms)B�y��J�}Hr�9���W�EȾ��@�)�o�`�Kсg%:X�a��|.KW�rc�j��+2�
�w����#���[����go�o���G�e���vi��$����@L�"^����P���W���4 �a���%?_�� ����{FU\
v$����՜h�[\(�y�QJ�]-B⊐K�����J�����:���)�*N��x�+��4��N��9�Rs��|��%�!�l}{j�j�Q�}�ݬd�����7��G��o�?8���^�"?LU����� ?�d��i�ђyu}�����΂sd��1��9�I�	���l�������ȵ�d�,uJ����6�0`���?�[�����1w���WnxA�x�I{w�r�2��x��P���Pz������2��?�]EYw~G�/��Hά�h�-^o���L�7�B���y.���mC� ?���İ��R������ ~aU�<�������{��{xɀ&��$@g�O*C�j,��.ņ8��l�&<����=����P��U|�7�VX PԸ =g�Z;�o�baO5/}%4���+��/(^P܋r�2��!W�	�G�*�,�Q4��Xr�^_����}t]������o��?���I듰��턻�!�R�F�νe�Ë�#����H���L��FJ���n�]���y#�U�������'u0�V�w5�Q���~��e����䝼���^i��t�z�_S��_/\n� ��=��˩+�!h\0eV�z��e� ����#ǌ�t)گ�ڴ�6-ɿ��ϻ��/��?���m�X���������[;A�����
e��AƠ�5͡�r��S-�{xyQ��ݱ�,i/�Mi�uV2]Yh� �D9�t��I����r(��,������9>nf�^�W�e/_H()t�Dt�L�d���E�����b���'����0JW{_n��{߆dΨ�u�ە�H6��l�]H1�_����\>Z%��V�־���B��'��v���������d!��]���:�>�@��fiac�%�ñ��Nzfc"ݦ�{b"�s��ę�=Юjog3dn�y"Z̙s^��N�+WT{p/e�H�q�0X�3v\Be�X��%H3y��Q���9Q�K@�\��Ћp���;a-��x�U�v/�nG0M�rG�]�Ǹ�$����_ ��!}��W��v�����u�ĜAQ	��t|�IG��1���<DQT
� %�c��(9�D0|�����)|h�Vp�poKv�@#�~�zv��*/BĜi���

��u2Ww�y\��W7w� �{z��9��-V<a�!)�K'z���|���q���ö3`��P�ªb�'UNx��D���'�˗Rk��W���/���<8��!K��*�+L�T��Jn�#Ǌ����D�>֎���� �����N��Ld]\���C��'ƘCbR�L�B�y�7���K41yI{{�PM\��q~G���;���"��E�FV%�h��HҚ��D���rʳGQ]k8{��q3����eǐ�2k��0����Ê�~����/���j��N��_��B��0u�W���M	?Q/����5�<$���Ҟ����6B��}F��pV ��#h�۰]dz�?��RV�v�.Ƅ��]]��Ű��a��A��L����>�y�0�8����j�&��2wwƹ��n/�k����b5������%�Ʉ	$�j�����{��'�O�sCל����[;9~m1-4�yǐXD;d�e�K�3��:h�����5�`U�����!���C�
^��5t���P}j�@CH��9���G�k(�H)S��%$>HW�SWAݲ�EVx�;�Ūù�+��"��y��\y~ ��J�̗g��h6�X�7����|܊E��3B6�Α:���ogE���1���%�g������?��������LZb�I%xԔgK��{��7���)����	�<����Zf��eW�:����r�aq�TM;&�]�^�}>�i�(;h�w��[�$/�k�:߽ �.e�j���Z���ۂ�!X���%�oZ1
�X�z�8��Ex"v�t�*0���,�]�h����� ���5�;�O�`�f��N��i����;��D��6�cz��
A�`��˥�!�g5Xa��\��t�i��GH� ���O%�����ڒ�����Dd��#p��,j�r+����X�]˫��>_XL)�p��E
6���]���ּ��,��2��"kx��*r��W{r`�ʃ�/ա��1Ĝ���D)��O�{$~x����[;A~��$(~�GH�"T��L=U��_�� �   Q},�/*��'Aƅ���( �Q9�Fi��$�"��\a�[��O��<~$ Ƿy�`Vj����%�G#[��5~J��L�t_�u�Э��z��[=Ԋf�qEP�l�37�(6�)���sW7�+�B����k�� �'۷�������_�?��Z      �      x������ � �      �      x�������� ]     