class virtualuser{

    define localuser ($uid, $gid, $team, $pass, $groups, $sshkey=""){

            #use regex to associate dn to group
            $client_group = $fqdn ? {
                /^.*-lms-.*-stg.2tor.net$/ => 'lms_staging',
                /^.*-lms-.*-qa.2tor.net$/ => 'lms_qa',
                /^.*-lms-.*-prod.2tor.net$/ => 'lms_prod',
                /^.*-mktg-.*-stg.2tor.net$/ => 'mktg_staging',
                /^.*-mktg-.*-qa.2tor.net$/ => 'mktg_qa',
                /^.*-mktg-.*-prod.2tor.net$/ => 'mktg_prod',
                /^.*-oars-.*-stg.2tor.net$/ => 'oars_staging',
                /^.*-oars-.*-qa.2tor.net$/ => 'oars_qa',
                /^.*-oars-.*-prod.2tor.net$/ => 'oars_prod',
                default    => undef,
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
