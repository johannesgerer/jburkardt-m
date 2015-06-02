function i4_moddiv_test ( )

%*****************************************************************************80
%
%% I4_MODDIV_TEST tests I4_MODDIV;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 4;

  ndivid = [ 50, -50, 50, -50 ];
  number = [ 107, 107, -107, -107 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_MODDIV_TEST\n' );
  fprintf ( 1, '  I4_MODDIV factors a number\n' );
  fprintf ( 1, '  into a multiple and a remainder.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Number   Divisor  Multiple Remainder\n' );
  fprintf ( 1, '\n' );
  
  for test = 1 : test_num
    [ nmult, nrem ] = i4_moddiv ( number(test), ndivid(test) );
    fprintf ( 1, '  %8d  %8d  %8d  %8d\n', number(test), ndivid(test), nmult, nrem );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeat using MOD:\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    nrem = mod ( number(test), ndivid(test) );
    nmult = floor ( number(test) / ndivid(test) );
    fprintf ( 1, '  %8d  %8d  %8d  %8d\n', number(test), ndivid(test), nmult, nrem );
  end
 
  return
end
