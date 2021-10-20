<?php
    $cfg['blowfish_secret'] = 'K2058UfC4dLpFD+zMbUY8ds3qfnA/KY7';
    /* Servers configuration */
    $i = 0;
    $i++;
    $cfg['Servers'][$i]['host'] = 'mysql-service:3306';
    //$cfg['Servers'][$i]['port'] = '';
    //$cfg['Servers'][$i]['socket'] = '';
    // $cfg['Servers'][$i]['connect_type'] = 'tcp';
    // $cfg['Servers'][$i]['extension'] = 'mysqli';
    $cfg['Servers'][$i]['auth_type'] = 'cookie';
    // $cfg['Servers'][$i]['user'] = 'root';
    // $cfg['Servers'][$i]['password'] = '';
    $cfg['Servers'][$i]['AllowNoPassword'] = true;

    /* End of servers configuration */

    $cfg['DefaultLang'] = 'en-utf-8';
    #$cfg['ServerDefault'] = 1;
    $cfg['UploadDir'] = '';
    $cfg['SaveDir'] = '';

    ?>