function r = van_der_corput_dataset ( base, seed, n )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_DATASET generates a van der Corput dataset.
%
%  Discussion:
%
%    This program is meant to be used interactively.  It's also
%    possible to prepare a simple input file beforehand and use it
%    in batch mode.
%
%  Usage:
%
%    r = van_der_corput_dataset ( base, seed, n )
%
%    where
%
%    * BASE, the base of the sequence;
%    * SEED, the index of the first element to be computed;
%    * N, the number of points to generate.
%    * R, the computed sequence of N values.
%
%    The program generates the data and writes it to the file
%
%      van_der_corput_BASE_SEED_N.txt
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 December 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'VAN_DER_CORPUT_DATASET\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generate a van der Corput dataset.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program requests input values from the user:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * BASE, the base,\n' );
  fprintf ( 1, '  * SEED, the index of the first element,\n' );
  fprintf ( 1, '  * N, the number of points to generate.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program generates the data, writes it to the file\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    van_der_corput_BASE_SEED_N.txt\n' );
%
%  Get BASE.
%
  if ( 1 <= nargin )
    base = str2num ( base );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Enter BASE, the van der Corput base,\n' );
    fprintf ( 1, '  often a prime number.\n' );
    fprintf ( 1, '  (Try ''2'' if you have no preference.)\n' );
    base = input ( '  Enter BASE:  ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  User input BASE = %d\n', base );
%
%  Get SEED.
%
  if ( 2 <= nargin )
    seed = str2num ( seed );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  SEED is the index of the first element.\n' );
    fprintf ( 1, '  (Try "0" or "1" if you have no preference.)\n' );
    seed = input ( '  Enter SEED:  ' );
  end

  fprintf ( 1, '  SEED = %d\n', seed );
%
%  Get N.
%
  if ( 3 <= nargin )
    n = str2num ( n );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  N is the number of points.\n' );
    fprintf ( 1, '  (Try ''25'' if you have no preference.)\n' );
    n = input ( '  Enter N:  ' );
  end

  fprintf ( 1, '  User input N = %d\n', n );
%
%  Compute the data.
%
  r = i4_to_van_der_corput_sequence ( seed, base, n );
%
%  Write it to a file.
%
  output_filename = ...
    strcat ( 'van_der_corput_', num2str ( base ), ...
    '_', num2str ( seed ), '_', num2str ( n ), '.txt' );

  r8mat_write ( output_filename, 1, n, r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to the file "%s".\n', ...
    output_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VAN_DER_CORPUT_DATASET:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function r = i4_to_van_der_corput_sequence ( seed, base, n )

%*****************************************************************************80
%
%% I4_TO_VAN_DER_CORPUT_SEQUENCE: next N elements of a van der Corput sequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    J H Halton,
%    On the efficiency of certain quasi-random sequences of points
%    in evaluating multi-dimensional integrals,
%    Numerische Mathematik,
%    Volume 2, pages 84-90, 1960.
% 
%    J G van der Corput,
%    Verteilungsfunktionen I & II,
%    Nederl. Akad. Wetensch. Proc.,
%    Volume 38, 1935, pages 813-820, pages 1058-1066.
%
%  Parameters:
%
%    Input, integer SEED, the seed or index of the desired element.
%    SEED should be nonnegative.
%    SEED = 0 is allowed, and returns R = 0.
%
%    Input, integer BASE, the van der Corput base, which is typically
%    a prime number.  BASE must be greater than 1.
%
%    Input, integer N, the number of elements to compute.
%
%    Output, real R[N], the SEED-th through SEED+N-1th elements of 
%    the van der Corput sequence for base BASE.
%
  r(1:n) = 0.0;
%
%  Ensure that BASE is an acceptable integer.
%
  base = floor ( base );

  if ( base <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_VAN_DER_CORPUT_SEQUENCE - Fatal error!\n' );
    fprintf ( 1, '  The input base BASE is <= 1!\n' );
    fprintf ( 1, '  BASE = %d\n', base );
    error ( 'I4_TO_VAN_DER_CORPUT_SEQUENCE - Fatal error!' );
  end
%
%  Ensure that SEED is an acceptable integer.
%
  seed = floor ( seed );
 
  if ( seed < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_VAN_DER_CORPUT_SEQUENCE - Fatal error!\n' );
    fprintf ( 1, '  The input base SEED is < 0!\n' );
    fprintf ( 1, '  SEED = %d\n', seed );
    error ( 'I4_TO_VAN_DER_CORPUT_SEQUENCE - Fatal error!' );
  end
%
%  Carry out the computation.
%
  seed2(1:n) = seed:1:seed+n-1;
  base_inv = 1.0 / base;
  
  while ( any ( seed2 ~= 0 ) )
    digit = mod ( seed2, base );
    r = r + digit * base_inv;
    base_inv = base_inv / base;
    seed2 = floor ( seed2 / base );
  end

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
    return;
  end
%
%  Write the data.
%
%  For smaller data files, and less precision, try:
%
%     fprintf ( output_unit, '  %14.6f', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16f', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
