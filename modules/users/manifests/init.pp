# == Class: users
# This is where all the resources (teams, users) are defined. First, the teams are created, and are then referenced by the users. Most of the changes will occur in the users group attribute, which determine individual access to servers.
# === Examples
# ==== Creating a group
#    teams::localteam{$teams::tech_support[title]:
#        gid => $teams::tech_support[id],
#    }
# ==== Creating a user
#    virtualuser::localuser {'dtillery':
#        uid     => 2002,
#        gid     => $teams::development_L2[id],
#        team    => $teams::development_L2[title],
#        pass    => 'david',
#        groups  => [all],
#        sshkey  => $sshkeys::users::dtillery,
#        require => Teams::Localteam[$teams::development_L2[title]],
#    }
#
class users{

    include teams
    include virtualuser
    include sshkeys::users

    #create clientside user groups
    teams::localteam{$teams::development_L2[title]:
        gid => $teams::development_L2[id],
    }

    teams::localteam{$teams::development_L1[title]:
        gid => $teams::development_L1[id],
    }

    teams::localteam{$teams::contract_marketing[title]:
        gid => $teams::contract_marketing[id],
    }

    teams::localteam{$teams::ebd[title]:
        gid => $teams::ebd[id],
    }

    teams::localteam{$teams::tech_support[title]:
        gid => $teams::tech_support[id],
    }

    #create clientside users
    virtualuser::localuser {'dtillery':
        uid     => 2002,
        gid     => $teams::development_L2[id],
        team    => $teams::development_L2[title],
        pass    => 'david',
        groups  => [all],
        sshkey  => $sshkeys::users::dtillery,
        require => Teams::Localteam[$teams::development_L2[title]],
    }

    virtualuser::localuser {'cconlin':
        uid     => 2003,
        gid     => $teams::development_L2[id],
        team    => $teams::development_L2[title],
        pass    => 'conlin',
        groups  => [all],
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
        groups  => [all],
        sshkey  => $sshkeys::users::ryanoneill,
        require => Teams::Localteam[$teams::development_L2[title]],
    }

    virtualuser::localuser {'dpeifer':
        uid     => 2006,
        gid     => $teams::development_L1[id],
        team    => $teams::development_L1[title],
        pass    => 'peifer',
        groups  => [lms_staging, mktg_staging, oars_staging, lms_qa, mktg_qa, oars_qa],
        sshkey  => $sshkeys::users::dpeifer,
        require => Teams::Localteam[$teams::development_L1[title]],
    }

    virtualuser::localuser {'ssalenger':
        uid     => 2007,
        gid     => $teams::development_L1[id],
        team    => $teams::development_L1[title],
        pass    => 'salenger',
        groups  => [lms_staging, mktg_staging, oars_staging, lms_qa, mktg_qa, oars_qa],
        sshkey  => $sshkeys::users::ssalenger,
        require => Teams::Localteam[$teams::development_L1[title]],
    }

    virtualuser::localuser {'mikeyfreedomhart':
        uid     => 2008,
        gid     => $teams::contract_marketing[id],
        team    => $teams::contract_marketing[title],
        pass    => 'freedomhart',
        groups  => [mktg_qa, lms_staging, oars_staging, mktg_staging],
        sshkey  => $sshkeys::users::mikeyfreedomhart,
        require => Teams::Localteam[$teams::contract_marketing[title]],
    }

    virtualuser::localuser {'mhart':
        uid     => 2009,
        gid     => $teams::contract_marketing[id],
        team    => $teams::contract_marketing[title],
        pass    => 'hart',
        groups  => [mktg_qa, lms_staging, oars_staging, mktg_staging],
        sshkey  => $sshkeys::users::mhart,
        require => Teams::Localteam[$teams::contract_marketing[title]],
    }

     virtualuser::localuser {'rparipooranan':
        uid     => 2010,
        gid     => $teams::ebd[id],
        team    => $teams::ebd[title],
        pass    => 'pooranan',
        groups  => [lms_qa, lms_staging, oars_staging, mktg_staging],
        sshkey  => $sshkeys::users::rparipooranan,
        require => Teams::Localteam[$teams::ebd[title]],
    }

    virtualuser::localuser {'nitai':
        uid     => 2011,
        gid     => $teams::ebd[id],
        team    => $teams::ebd[title],
        pass    => 'ni',
        groups  => [lms_qa, lms_staging, oars_staging, mktg_staging],
        sshkey  => $sshkeys::users::nitai,
        require => Teams::Localteam[$teams::ebd[title]],
    }

    virtualuser::localuser {'dmorales':
        uid     => 2012,
        gid     => $teams::tech_support[id],
        team    => $teams::tech_support[title],
        pass    => 'morales',
        groups  => [oars_prod],
        sshkey  => $sshkeys::users::dmorales,
        require => Teams::Localteam[$teams::tech_support[title]],
    }


}
