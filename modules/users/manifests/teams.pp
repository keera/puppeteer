class teams{

    $development = {
        id   => 2002,
        title => 'developers',
    }

    $assurance = {
        id   => 2003,
        title => 'qa',
    }

    $production = {
        id   => 2004,
        title => 'production',
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
