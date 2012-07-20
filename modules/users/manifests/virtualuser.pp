class virtualuser{

    define localuser ($uid, $gid, $team, $pass, $groups, $sshkey=""){

            #use regex to associate dn to group
            $client_group = $fqdn ? {
                /(ubuntu)/ => 'test',
                default    => 'blah',
            }

            #set status for user and user home dir
            if $client_group in $groups or 'all' in $groups{
                $user_status = 'present'
                $file_status = 'directory'
            }else{
                $user_status = 'absent'
                $file_status = 'absent'
            }

            user { $title:
                ensure   => $user_status,
                uid      => $uid,
                gid      => $gid,
                password => $pass,
                shell    => '/bin/bash',
                home     => "/home/$title",
            }

            file { "/home/$title":
                owner   => $title,
                group   => "$team",
                ensure  => $file_status,
                require => User[$title],
                force   => true
            }

            if ($sshkey != "") {
                ssh_authorized_key {$title:
                    ensure  =>  $user_status,
                    type    => "ssh-rsa",
                    key     => "$sshkey",
                    user    => "$title",
                    name    => "$title",
                    require => [User["$title"], File["/home/$title"]],
                }
            }

        }
}
