jarg_dir=$HOME/.config/jarg
jarg_file=$jarg_dir/pos.txt
jarg_url=https://raw.githubusercontent.com/staticshock/wordlist/master/jargon-wl/pos.txt

function jarg_update () {
  mkdir -p $jarg_dir
  wget $jarg_url -o $jarg_file
  grep N$ pos.txt | cut -f1 > $jarg_dir/noun.txt
  grep Av$ pos.txt |cut -f1 > $jarg_dir/adj.txt
}

function jarg_word () {
  perl -e'@_=<>,print substr $_[int(rand($#_+1))], 0, -1' $1
}

function jarg () {
  if [ ! -f $jarg_file ]; then
    jarg_update
  fi

  jarg_word $jarg_dir/adj.txt
  echo -n ', '
  jarg_word $jarg_dir/adj.txt
  echo -n ' '
  jarg_word $jarg_dir/noun.txt
  echo
}

