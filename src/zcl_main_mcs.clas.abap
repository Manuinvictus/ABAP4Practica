CLASS zcl_main_mcs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_main_mcs IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: cm  TYPE REF TO zcl_customer_manager_mcs,
    customers TYPE TABLE OF ztcustomer_mcs,
    c         TYPE zstruct_customer_mcs,
    return    TYPE string.

    CREATE OBJECT cm.

    return = cm->insert_customer( c_id = '1'
                c_name = 'Sheyla Resmella'
                isavailable  = 'N' ).

    IF return = 0.
        out->write( 'Alumno insertado exitosamente' ).
    ELSE.
        out->write( 'Error al insertar alumno' ).
    ENDIF.

    return = cm->insert_customer( c_id = '2'
                c_name = 'Manuel Claveria'
                isavailable  = 'Y' ).

    IF return = 0.
        out->write( 'Alumno insertado exitosamente' ).
    ELSE.
        out->write( 'Error al insertar alumno' ).
    ENDIF.

    return = cm->insert_customer( c_id = '3'
                c_name = 'Luigi Puccini'
                isavailable  = 'N' ).

    IF return = 0.
        out->write( 'Alumno insertado exitosamente' ).
    ELSE.
        out->write( 'Error al insertar alumno' ).
    ENDIF.

    return = cm->insert_customer( c_id = '4'
                c_name = 'Alejandro Monreal'
                isavailable  = 'N' ).

    IF return = 0.
        out->write( 'Alumno insertado exitosamente' ).
    ELSE.
        out->write( 'Error al insertar alumno' ).
    ENDIF.

    SELECT * FROM ztcustomer_mcs INTO TABLE @customers.

    LOOP AT customers INTO c.
      out->write( |ID: { c-id } Nombre: { c-name } Activo: { c-isavailable }| ).
    ENDLOOP.

    return = cm->update_customer( c_id = '4'
                c_name = 'Alejandro Monreal'
                isavailable  = 'Y' ).

    IF return = 0.
        out->write( 'Alumno editado exitosamente' ).
    ELSE.
        out->write( 'Error al editar alumno' ).
    ENDIF.

    return = cm->update_customer( c_id = '3'
                c_name = 'Mario Puccini'
                isavailable  = 'N' ).

    IF return = 0.
        out->write( 'Alumno editado exitosamente' ).
    ELSE.
        out->write( 'Error al editar alumno' ).
    ENDIF.

    SELECT * FROM ztcustomer_mcs INTO TABLE @customers.

    LOOP AT customers INTO c.
      out->write( |ID: { c-id } Nombre: { c-name } Activo: { c-isavailable }| ).
    ENDLOOP.

    return = cm->delete_customer( c_id = '2' ).

    IF return = 0.
        out->write( 'Alumno eliminado exitosamente' ).
    ELSE.
        out->write( 'Error al eliminar alumno' ).
    ENDIF.

    SELECT * FROM ztcustomer_mcs INTO TABLE @customers.

    LOOP AT customers INTO c.
      out->write( |ID: { c-id } Nombre: { c-name } Activo: { c-isavailable }| ).
    ENDLOOP.

    cm->delete_customer( c_id = '1' ).
    cm->delete_customer( c_id = '3' ).
    cm->delete_customer( c_id = '4' ).
  ENDMETHOD.
ENDCLASS.
