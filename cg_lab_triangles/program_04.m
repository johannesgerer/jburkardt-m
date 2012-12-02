function program_04 ( )

%*****************************************************************************80
%
%% PROGRAM_04 demonstrates sampling of a triangle.
%
%  Discussion:
%
%    The program
%    * reads a triangle T (defined by three points),
%    * reads a random number seed;
%    * reads "1" for bad scheme, "2" for good scheme.
%    * reads N, the number of random values to generate;
%    * it then computes N random points in the triangle;
%    * it determines N1, N2, and N3, the number of points
%      that ended up in subtriangles mbc, amc, and abm,
%      where "m" is the centroid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROGRAM_04 - Uniform Sampling\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Define a triangle T:\n' );

  t_v1 = input ( '  Enter [ T.v1.x, T.v1.y]: ' ); 
  t_v2 = input ( '  Enter [ T.v2.x, T.v2.y]: ' ); 
  t_v3 = input ( '  Enter [ T.v3.x, T.v3.y]: ' ); 
%
%  Get the random seed.
%
  seed = input ( 'Enter a random number seed:  ' );
  rand ( 'state', seed );
%
%  Get the scheme to use.
%
  scheme = input ( 'Enter 1 for "bad scheme", 2 for "good scheme":  ' );
%
%  Get the number of values to generate.
%
  n = input ( 'Enter the number of samples to generate:  ' );

  n1 = 0;
  n2 = 0;
  n3 = 0;

  for i = 1 : n

    if ( scheme == 1 )
      r = rand;
      s = rand;
      t = rand;
      xi1 = r / ( r + s + t );
      xi2 = s / ( r + s + t );
      xi3 = t / ( r + s + t );
    elseif ( scheme == 2)
      r = rand;
      s = rand;

      xi1 =   1.0       - sqrt ( s );
      xi2 = ( 1.0 - r ) * sqrt ( s );
      xi3 =         r   * sqrt ( s );
    end

    if ( xi1 < xi2 & xi1 < xi3 )
      n1 = n1 + 1;
    elseif ( xi2 < xi1 & xi2 < xi3 )
      n2 = n2 + 1;
    elseif ( xi3 < xi1 & xi3 < xi2 )
      n3 = n3 + 1;
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N1 = %8d  %% = %8.4f\n', n1, 100 * n1 / n );
  fprintf ( 1, '  N2 = %8d  %% = %8.4f\n', n2, 100 * n2 / n );
  fprintf ( 1, '  N3 = %8d  %% = %8.4f\n', n3, 100 * n3 / n );
  fprintf ( 1, '  N  = %8d  %% = %8.4f\n', n, 100 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROGRAM_04\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  
  return
end
