@php
    // using ldap bind
    $ldaprdn  = 'uid=tesla,dc=example,dc=com';     // ldap rdn or dn
    $ldappass = 'password';  // associated password
    

    // connect to ldap server
    $ldapconn = ldap_connect("ldap.forumsys.com")
        or die("Could not connect to LDAP server.");
    
    if ($ldapconn) {

        // add below script if you have errro : ldap_bind(): Unable to bind to server: Protocol error
        ldap_set_option($ldapconn, LDAP_OPT_PROTOCOL_VERSION, 3);

        // binding to ldap server
        $ldapbind = ldap_bind($ldapconn, $ldaprdn, $ldappass);

        // verify binding
        if ($ldapbind) {
            echo "LDAP bind successful...";
        } else {
            echo "LDAP bind failed...";
        }

    }
@endphp