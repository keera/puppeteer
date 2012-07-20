class users{

    include virtualuser
    include virtualteam
    include usergroups

    #create clientside user groups
    virtualteam::localteam{"developers":
        gid => 2002,
    }

    #create clientside users
    virtualuser::localuser {"john":
        uid    => 2000,
        gid    => 2002,
        pass   => "harhar",
        team   => "developers",
        groups => [ $usergroups::group[all] ],
        sshkey => "abcdeSSHKEYfg",
        require => Virtualteam::Localteam["developers"],
    }

    virtualuser::localuser {"joe":
        uid    => 2001,
        gid    => 2002,
        pass   => "harhar",
        team   => "developers",
        groups => [ $usergroups::group[all] ],
        sshkey => "1234SSHKEYfg",
        require => Virtualteam::Localteam["developers"],
    }

    #virtualuser::localuser {"luke":
    #    groups => [ $usergroups::group[none] ]
    #}

    #virtualuser::localuser {"mark":
    #    groups => [ $usergroups::group[lms] ]
    #}

}
