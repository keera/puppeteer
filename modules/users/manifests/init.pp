class users{

    include virtualuser
    include virtualteam
    include usergroups
    include sshkeys::users

    #create clientside user groups
    virtualteam::localteam{$virtualteam::development[title]:
        gid => $virtualteam::development[id],
    }

    #create clientside users
    virtualuser::localuser {'john':
        uid     => 2000,
        gid     => $virtualteam::development[id],
        team    => $virtualteam::development[title],
        pass    => 'harhar',
        groups  => [$usergroups::group[all]],
        sshkey  => $sshkeys::users::john,
        require => Virtualteam::Localteam[$virtualteam::development[title]],
    }

    virtualuser::localuser {'joe':
        uid     => 2001,
        gid     => $virtualteam::development[id],
        team    => $virtualteam::development[title],
        pass    => 'jarjar',
        groups  => [$usergroups::group[true_test]],
        sshkey  => $sshkeys::users::joe,
        require => Virtualteam::Localteam[$virtualteam::development[title]],
    }

}
