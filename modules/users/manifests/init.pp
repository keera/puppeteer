class users{
    include virtualuser
    include usergroups

    virtualuser::localuser {"john":
        uid    => 2000,
        pass   => "harhar",
        team   => "developers",
        groups => [ $usergroups::group[none] ],
        sshkey => "abcdeSSHKEYfg",
    }

    virtualuser::localuser {"joe":
        uid    => 2001,
        pass   => "harhar",
        team   => "developers",
        groups => [ $usergroups::group[none] ],
        sshkey => "1234SSHKEYfg",
    }

    #virtualuser::localuser {"luke":
    #    groups => [ $usergroups::group[none] ]
    #}

    #virtualuser::localuser {"mark":
    #    groups => [ $usergroups::group[lms] ]
    #}

}
