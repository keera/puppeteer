class virtualteam{

    define localteam($gid){

        group { "$title":
            gid    => $gid,
            name   => "$title",
            system => false,
        }

    }

}
