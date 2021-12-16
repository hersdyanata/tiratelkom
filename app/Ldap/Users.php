<?php

namespace App\Ldap;

// use LdapRecord\Models\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notificable;
use LdapRecord\Laravel\Auth\AuthenticatesWithLdap;

class Users extends Model
{
    /**
     * The object classes of the LDAP model.
     *
     * @var array
     */
    public static $objectClasses = [
        'top',
        'person',
        'organizationalperson',
        'inetOrgPerson',
    ];
}
