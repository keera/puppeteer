class users{

    include teams
    include virtualuser
    include sshkeys::users

    #create clientside user groups
    teams::localteam{$teams::development_L2[title]:
        gid => $teams::development_L2[id],
    }

    #create clientside users
    virtualuser::localuser {'dtillery':
        uid     => 2002,
        gid     => $teams::development_L2[id],
        team    => $teams::development_L2[title],
        pass    => 'david',
        groups  => [lms_staging],
        sshkey  => $sshkeys::users::dtillery,
        require => Teams::Localteam[$teams::development_L2[title]],
    }

    virtualuser::localuser {'cconlin':
        uid     => 2003,
        gid     => $teams::development_L2[id],
        team    => $teams::development_L2[title],
        pass    => 'conlin',
        groups  => [lms_qa],
        sshkey  => $sshkeys::users::cconlin,
        require => Teams::Localteam[$teams::development_L2[title]],
    }

    virtualuser::localuser {'rganeshan':
        uid     => 2004,
        gid     => $teams::development_L2[id],
        team    => $teams::development_L2[title],
        pass    => 'ganeshan',
        groups  => [all],
        sshkey  => $sshkeys::users::rganeshan,
        require => Teams::Localteam[$teams::development_L2[title]],
    }

     virtualuser::localuser {'ryanoneill':
        uid     => 2005,
        gid     => $teams::development_L2[id],
        team    => $teams::development_L2[title],
        pass    => 'oneill',
        groups  => [none],
        sshkey  => $sshkeys::users::ryanoneill,
        require => Teams::Localteam[$teams::development_L2[title]],
    }

}
