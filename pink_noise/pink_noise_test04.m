function pink_noise_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests RAN1F.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 May 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  RAN1F generates random values with an approximate\n' );
  fprintf ( 1, '  1/F distribution.\n' );

  b = 1;

  while ( b < 32 )

    for rep = 1 : 4

      u = rand ( b, 1 );
      q = zeros ( b, 1 );

      fprintf ( 1, '\n' );
      fprintf ( 1, '   B   I      Y\n' );
      fprintf ( 1, '\n' );

      for i = 1 : 20
        [ y, u, q ] = ran1f ( b, u, q );
        fprintf ( 1, '  %2d  %2d  %10f\n', b, i, y );
      end
    end

    b = b * 2;

  end

  return
end