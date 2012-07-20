class users{

    include virtualuser
    include virtualteam
    include usergroups

    #create clientside user groups
    $dev_title = "developers"
    $dev_gid   = 2002
    virtualteam::localteam{"$dev_title"
        gid => $dev_gid,
    }

    #create clientside users
    virtualuser::localuser {'john':
        uid     => 2000,
        gid     => $dev_gid,
        team    => $dev_title,
        pass    => 'harhar',
        groups  => [$usergroups::group[none]],
        sshkey  => 'abcdeSSHKEYfg',
        require => Virtualteam::Localteam[$dev_title],
    }

    virtualuser::localuser {'joe':
        uid     => 2001,
        gid     => $dev_gid,
        team    => $dev_title,
        pass    => 'harhar',
        groups  => [$usergroups::group[none]],
        sshkey  => '1234SSHKEYfg',
        require => Virtualteam::Localteam[$dev_title],
    }

}
