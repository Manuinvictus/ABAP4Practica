CLASS zcl_customer_manager_mcs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS insert_customer IMPORTING c_id TYPE string
                                    c_name TYPE string
                                    isavailable TYPE string
                          RETURNING VALUE(ret) TYPE sy-subrc.
  METHODS update_customer IMPORTING c_id TYPE string
                                    c_name TYPE string
                                    isavailable TYPE string
                          RETURNING VALUE(ret) TYPE sy-subrc.
  METHODS delete_customer IMPORTING c_id TYPE string
                          RETURNING VALUE(ret) TYPE sy-subrc.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_customer_manager_mcs IMPLEMENTATION.
  METHOD insert_customer.
    DATA: ls_customer TYPE ztcustomer_mcs.
    CLEAR ls_customer.
    ls_customer-id = c_id.
    ls_customer-name = c_name.
    ls_customer-isavailable = isavailable.
    INSERT ztcustomer_mcs FROM @ls_customer.
    RETURN sy-subrc.
  ENDMETHOD.

  METHOD update_customer.
    UPDATE ztcustomer_mcs SET name = @c_name,
                              isavailable = @isavailable
                        WHERE id = @c_id.
    RETURN sy-subrc.
  ENDMETHOD.

  METHOD delete_customer.
    DELETE FROM ztcustomer_mcs WHERE id = @c_id.
    RETURN sy-subrc.
  ENDMETHOD.
ENDCLASS.
