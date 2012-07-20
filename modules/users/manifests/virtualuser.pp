class virtualuser{

define localuser ($uid, $pass, $groups, $sshkey=""){

        $group = $fqdn ? {
            /(ubuntu)/ => "test",
            default   => "blah",
        }

        if $group in $groups or 'all' in $groups{
            $status = 'present'
        }else{
            $status = 'absent'
        }

        if $group == "haha"{
            notify{"This shit fucking $title":}
        }

        user { $title:
            ensure => $status,
            uid    => $uid,
            home   => "/home/$title",
            password => $pass,
        }

        if ($sshkey != "") {
            ssh_authorized_key {$title:
                ensure =>  $status,
                type   => "ssh-rsa",
                key    => "$sshkey",
                user   => "$title",
                name   => "$title",
                require => User["$title"],
            }
        }

    }

}
