function i4lib_test23 ( )

%*****************************************************************************80
%
%% TEST23 tests I4_WRAP.
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
  ilo = 4;
  ihi = 8;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST23\n' );
  fprintf ( 1, '  I4_WRAP forces an integer to lie within given limits.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ILO = %d\n', ilo );
  fprintf ( 1, '  IHI = %d\n', ihi );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I  I4_WRAP(I)\n' );
  fprintf ( 1, '\n' );

  for i = -10 : 20
    fprintf ( 1, '  %6d  %6d\n', i, i4_wrap ( i, ilo, ihi ) );
  end

  return
end
