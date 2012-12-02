function niederreiter2_test02 ( )

%*****************************************************************************80
%
%% NIEDERREITER2_TEST02 tests PLYMUL2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NIEDERREITER2_TEST02\n' );
  fprintf ( 1, '  PLYMUL2 computes the product of two polynomials\n' );
  fprintf ( 1, '  base 2.\n' );

  [ add, mul, sub ] = setfld2 ( 0 );

  pa_deg = 2;
  pa = [ 1, 0, 1 ];
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Polynomial A:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : pa_deg+1
    fprintf ( 1, '%d  %d\n', i-1, pa(i) );
  end

  pb_deg = 1;
  pb = [ 1, 1 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Polynomial B:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : pb_deg+1
    fprintf ( 1, '%d  %d\n', i-1, pb(i) );
  end

  [ pc_deg, pc ] = plymul2 ( add, mul, pa_deg, pa, pb_deg, pb );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Polynomial C:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : pc_deg+1
    fprintf ( 1, '%d  %d\n', i-1, pc(i) );
  end

  return
end
