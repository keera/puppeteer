class vim_config{

    file {"/home/alan/.vimrc":
        owner => root,
        group => root,
        mode => 440,
        source => "puppet:///modules/vim_config/.vimrc",
        ensure => present
    }
}
