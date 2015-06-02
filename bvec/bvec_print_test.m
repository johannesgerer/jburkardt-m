function bvec_print_test ( )

%*****************************************************************************80
%
%% BVEC_PRINT_TEST tests BVEC_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 December 2014
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  bvec = [ 1, 0, 0, 1, 0, 1, 1, 1, 0, 0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BVEC_PRINT_TEST\n' );
  fprintf ( 1, '  BVEC_PRINT prints a binary vector.\n' );

  bvec_print ( n, bvec, '  BVEC:' );

  return
end
