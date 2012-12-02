function unicycle_test02 ( )

%*****************************************************************************80
%
%% UNICYCLE_TEST02 tests UNICYCLE_ENUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
  n_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNICYCLE_TEST02\n' );
  fprintf ( 1, '  UNICYCLE_ENUM enumerates the unicycles of N objects.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N    Number\n' );
  fprintf ( 1, '\n' );

  for n = 0 : n_max

    num = unicycle_enum ( n );
    fprintf ( 1, '  %3d  %8d\n', n, num );

  end

  return
end