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
