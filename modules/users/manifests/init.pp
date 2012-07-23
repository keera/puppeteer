class users{

    include virtualuser
    include virtualteam
    include usergroups

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
        sshkey  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDHV5JEHtAVrK2JuBeBneUKe7CSRiKt44Cb+Y89CZWvXe8pTTQAy1I54X78ghivur5ebs/VnYEPzty/o06FiIZc4ax25hve0T41VLlsnAmcUigt8Fdiiiq7O1ZBCPqg9HF4338vIq/u6DjdRSci7XW2YEa3zWSYjIfmLl6gaGI26+h7dKOqwyOR7baw8SHgTVXtUxGiRKGZXC4bQwBNLOFPhGNLbUKVF8TDtQBLzz/zEoTLIrHZJBi/SQOckj03yh+tfBa9UhkpgP6ZJeKfB0bq1cSmX/tocBeVs3wr+mftzOgBsT4QO4mSGgq2It5jxnx1GXgiJY0VZkXEdUISkYAt',
        require => Virtualteam::Localteam[$virtualteam::development[title]],
    }

    virtualuser::localuser {'joe':
        uid     => 2001,
        gid     => $virtualteam::development[id],
        team    => $virtualteam::development[title],
        pass    => 'harhar',
        groups  => [$usergroups::group[true_test]],
        sshkey  => '1234SSHKEYfg',
        require => Virtualteam::Localteam[$virtualteam::development[title]],
    }

}
