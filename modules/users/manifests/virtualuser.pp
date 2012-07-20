class virtualuser{

    group { 'developers':
        gid         => 2002,
        name        => 'developers',
        system      => false,
    }

    define localuser ($uid, $pass, $team, $groups, $sshkey=""){

            $group = $fqdn ? {
                /(ubuntu)/ => "test",
                default   => "blah",
            }

            if $group in $groups or 'all' in $groups{
                $user_status = 'present'
                $file_status = 'directory'
            }else{
                $user_status = 'absent'
                $file_status = 'absent'
            }

            user { $title:
                ensure => $user_status,
                uid    => $uid,
                gid    =>  2002,
                password => $pass,
                shell   =>  '/bin/bash',
                home   => "/home/$title",
                require =>  Group[$team],
            }

            file { "/home/$title":
                owner   => $title,
                group   => "$team",
                ensure  => $file_status,
                require => User[$title],
                force   => "true"
            }

            if ($sshkey != "") {
                ssh_authorized_key {$title:
                    ensure =>  $user_status,
                    type   => "ssh-rsa",
                    key    => "$sshkey",
                    user   => "$title",
                    name   => "$title",
                    require => [User["$title"], File["/home/$title"]],
                }
            }

        }

}
