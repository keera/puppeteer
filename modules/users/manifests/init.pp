class users{

    include virtualuser
    include virtualteam
    include usergroups
    include userteams

    #create clientside user groups
    virtualteam::localteam{
        "$userteams::development[title]":
        gid => $userteams::development[id],
    }

    #create clientside users
    virtualuser::localuser {'john':
        uid     => 2000,
        gid     => $userteams::development[id],
        team    => $userteams::development[title],
        pass    => 'harhar',
        groups  => [$usergroups::group[none]],
        sshkey  => 'abcdeSSHKEYfg',
        require => Virtualteam::Localteam['developers'],
    }

    virtualuser::localuser {'joe':
        uid     => 2001,
        gid     => $userteams::development[id],
        team    => $userteams::development[title],
        pass    => 'harhar',
        groups  => [$usergroups::group[none]],
        sshkey  => '1234SSHKEYfg',
        require => Virtualteam::Localteam['developers'],
    }

}
