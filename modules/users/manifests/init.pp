class users{

    include teams
    include virtualuser
    include usergroups
    include sshkeys::users

    #create clientside user groups
    teams::localteam{$teams::development[title]:
        gid => $teams::development[id],
    }

    #create clientside users
    virtualuser::localuser {'john':
        uid     => 2000,
        gid     => $teams::development[id],
        team    => $teams::development[title],
        pass    => 'harhar',
        groups  => [$usergroups::group[none]],
        sshkey  => $sshkeys::users::john,
        require => Teams::Localteam[$teams::development[title]],
    }

    virtualuser::localuser {'joe':
        uid     => 2001,
        gid     => $teams::development[id],
        team    => $teams::development[title],
        pass    => 'jarjar',
        groups  => [$usergroups::group[true_test]],
        sshkey  => $sshkeys::users::joe,
        require => Teams::Localteam[$teams::development[title]],
    }

}
