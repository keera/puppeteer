# == Class: teams
# == Define: localteam
# all teams correspond to linux groups. A user is part of a system level group, which is a team. The class definition abstracts away the concrete definition of group data and allows one to simply refer to a group by name. It also allows group information to be changed in a single place.
# === Parameters
# [*gid*]
#   The group id of the team, which must be unique on a client machine.
# === Examples
# ==== Defining a team in class
#   $ninjas = {
#       id    => 2000,
#       title => 'ninjas',
#   }
# === Authors
# Alan Lin <alin@2tor.com>
# Gregory Damiani <gdamiani@2tor.com>
# Copyright 2012 2tor
#
class teams{

    $development_L1 = {
        id   => 2002,
        title => 'developers_L1',
    }

    $development_L2 = {
        id   => 2003,
        title => 'developers_L2',
    }

    $contract_marketing = {
        id  => 2004,
        title => 'contract_marketing_developers'
    }

    $ebd = {
        id => 2005,
        title => 'EBD'
    }

    $tech_support = {
        id   => 2006,
        title => 'tech_support',
    }

    #team resource
    define localteam($gid){

        group { "$title":
            gid    => $gid,
            name   => "$title",
            system => false,
        }

    }

}
