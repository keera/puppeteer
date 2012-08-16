# == Define: localuser
# Creates an authorized user on a client
# == Parameters
# [*uid*]
#   id for the user. Must be unique on the client.
# [*gid*]
#   id of the group that the user belongs to on the client.
# [*team*]
#   name of the group that the user belongs to on the client.
# [*pass*]
#   password authentication.
# [*access_list*]
#   the list of servers that the user has access to.
# [*sshkey*]
#   the public key of the user
# === Examples
# ====  Configuring the group matching for individual servers
#   $client = $fqdn ? { 
#                /^.*-app-.*-staging.company.net$/ => 'app_staging',
#                /^.*-app-.*-production.company.net$/ => 'app_qa',
#                default    => undef,
#           }
# === Authors
# Alan Lin <alin@2tor.com>
# Gregory Damiani <gdamiani@2tor.com>
# === Copyright
# Copyright 2012 2tor
#
class virtualuser{

    define localuser ($uid, $gid, $team, $pass, $access_list, $sshkey=""){

            #use regex to associate dn to group
            $client = $fqdn ? {
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
            if $client in $access_list or 'all' in $access_list{
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
