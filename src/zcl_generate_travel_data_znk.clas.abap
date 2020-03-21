CLASS zcl_generate_travel_data_znk DEFINITION
 PUBLIC
 FINAL
 CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_generate_travel_data_znk IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA:itab TYPE TABLE OF ztravel_znk.

*   read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).

*   fill internal travel table (itab)
    itab = VALUE #(
        ( travel_id = '00000022'
          agency_id = '070001'
          customer_id = '000077'
          begin_date = '20190624'
          end_date = '20190628'
          booking_fee = '60.00'
          total_price =  '750.00'
          currency_code = 'USD'
          description = 'Enter your comments here'
          overall_status = 'A'
          created_by = 'MUSTERMANN'
          created_at = '20190612133945.5960060'
          last_changed_by = 'MUSTERFRAU'
          last_changed_at = '20190702105400.3647680'  )
        ( travel_id = '00000106'
          agency_id = '070005'
          customer_id = '000005'
          begin_date = '20190613'
          end_date = '20190716'
          booking_fee = '17.00'
          total_price = '650.00'
          currency_code = 'AFN'
          description = 'Enter your comments here'
          overall_status = 'A'
          created_by = 'MUSTERMANN'
          created_at = '20190613111129.2391370'
          last_changed_by = 'MUSTERMANN'
          last_changed_at = '20190711140753.1472620' )
        ( travel_id = '00000103'
          agency_id = '070010'
          customer_id = '000011'
          begin_date = '20190610'
          end_date = '20190714'
          booking_fee = '17.00'
          total_price = '800.00'
          currency_code = 'AFN'
          description = 'Enter your comments here'
          overall_status = 'X'
          created_by = 'MUSTERFRAU'
          created_at = '20190613105654.4296640'
          last_changed_by = 'MUSTERFRAU'
          last_changed_at = '20190613111041.2251330' ) ).

*   delete existing entries in the database table
    DELETE FROM ztravel_znk.

*   insert the new table entries
    INSERT ztravel_znk FROM TABLE @itab.

*   check the result
    SELECT * FROM ztravel_znk INTO TABLE @itab.
    out->write( sy-dbcnt ).
    out->write( 'Travel data inserted successfully!').

  ENDMETHOD.
ENDCLASS.
