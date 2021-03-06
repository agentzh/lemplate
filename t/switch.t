use t::TestJemplate tests => 1;

filters { 'tt' => ['parse_lite', 'X_line_numbers'] };
run_is 'tt' => 'js';

__END__

=== SWITCH/CASE Directives
--- tt
Foo
[%- SWITCH foo -%]
    [%- CASE 'Bar' -%]
        [%- 'Bar' -%]
    [%- CASE DEFAULT -%]
        [%- 'Baz' -%]
[%- END -%]
Zot
--- js
output.push('Foo');
//line X "(unknown template)"

    switch(stash.get('foo')) {
case 'Bar':
//line X "(unknown template)"
output.push('Bar');
break;

default:
//line X "(unknown template)"
output.push('Baz');
break;

    }


output.push('Zot\n');

