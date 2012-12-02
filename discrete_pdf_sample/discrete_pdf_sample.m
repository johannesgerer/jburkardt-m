function xy = discrete_pdf_sample ( n )

%*****************************************************************************80
%
%% DISCRETE_PDF_SAMPLE creates and samples a discrete PDF.
%
%  Discussion:
%
%    This program is an example of how discrete sample or density data
%    can be used to define a PDF (probability density function). 
%
%    In this function and the functions it calls, we assume that we have
%    data for an array of 20 by 20 square subcells of the unit square.
%    We wish to derive a PDF that will allow us to sample an arbitrary
%    number of points from this region.
%
%    In particular, we intend to use the discrete data to generate a PDF
%    which we will then use to generate sample points.
%
%    Roughly speaking, we have kept track of how many fish we caught in
%    each part of a lake, and now we want to simulate catching N fish
%    under the same conditions.
%
%    The statistics for each simulation should be governed by the discrete
%    PDF, but with random variation.  In other words, the actual number
%    of points taken from each subregion is random, and the actual location of
%    each point in a subregion is random, but over many simulations, the
%    statistics of the sample points should reproduce the statistics of
%    the original discrete sample that defined the PDF.
%
%  Usage:
%
%    xy = discrete_pdf_sample ( n )
%
%    where
%
%    * n is the number of sample points desired;
%    * xy is the set of 2D sample points generated.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of sample points to be generated.
%
%    Output, real XY(2,N), the sample points.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DISCRETE_PDF_SAMPLE:\n' );
  fprintf ( 1, '  Generate sample data using a discrete PDF.\n' );

  if ( nargin < 1 )
    n = input ( 'Enter N, the number of samples to generate:  ' );
  end
%
%  Construct a PDF from the data.
%
  pdf = get_discrete_pdf ( );
%
%  "Integrate" the data over rows and columns of the region to get the CDF.
%
  cdf = set_discrete_cdf ( pdf );
%
%  Choose N CDF values at random.
%
  seed = 123456789;
  [ u, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Find the cell corresponding to each CDF value,
%  and choose a random point in that cell.
%
  xy = discrete_cdf_to_xy ( cdf, n, seed, u );
%
%  Write data to a file for examination, plotting, or analysis.
%
  filename = 'discrete_pdf_sample.txt';
  r8mat_write ( filename, 2, n, xy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote sample data to file "%s".\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DISCRETE_PDF_SAMPLE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function xy = discrete_cdf_to_xy ( cdf, n, seed, u )

%*****************************************************************************80
%
%% DISCRETE_CDF_TO_XY finds XY points corresponding to discrete CDF values.
%
%  Discussion:
%
%    This program is given a discrete CDF function and a set of N random
%    values U.  Each value of U corresponds to a particular (I,J) subregion
%    whose CDF value just exceeds the value of U.  Inside that subregion,
%    we pick a point at random - this is equivalent to assuming the PDF
%    is constant over the subregion.
%
%    This function is part of an example program, for which various
%    assumptions have been made.  In particular, the region is the unit
%    square, and the subregions are formed by a 20 by 20 grid of equal
%    subsquares.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real CDF(20,20), the CDF values associated with each subcell.
%    A particular ordering has been given to the subcells so that the
%    CDF is a monotonoe function when the subcells are listed in that order.
%
%    Input, integer N, the number of sample points.
%
%    Input, real U(N), N random values.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real XY(2,N), the sample points.
%
  xy(1:2,1:n) = 0.0;

  low = 0.0;
  for j = 1 : 20
    for i = 1 : 20
      high = cdf(i,j);
      for k = 1 : n
        if ( low <= u(k) && u(k) <= high )
          [ r, seed ] = r8vec_uniform_01 ( 2, seed );
          xy(1,k) = ( ( i - 1 ) + r(1) ) / 20;
          xy(2,k) = ( ( j - 1 ) + r(2) ) / 20;
        end
      end
      low = high;
    end
  end

  return
end
function pdf = get_discrete_pdf ( )

%*****************************************************************************80
%
%% GET_DISCRETE_PDF returns the value of the discrete PDF function in each cell.
%
%  Discussion:
%
%    Cell (I,J) extends from 
%
%      (I-1) * H < Y < I * H
%      (J-1) * H < X < J * H
%
%    We have data for each cell, representing the integral of some PDF
%    over that cell.  The function pdf(x,y) must be nonnegative.  However,
%    we don't impose any other conditions on it.
%
%    The array PDF(:,:) contains the integral of pdf(x,y) over each cell,
%    or, almost as good, simply a sample or average value.
%
%    We load the array PDF, and then we normalize it so that the sum of
%    all the entries is 1.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real PDF(20,20).  PDF(I,J) is the discrete PDF for the cell (I,J),
%    normalized so that the sum over all cells is 1.
%

%
%  This is the raw data.
%
  pdf = [ ...
    0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000; ...
    0.0000,0.0000,0.0001,0.0001,0.0002,0.0002,0.0002,0.0003,0.0003,0.0003,0.0003,0.0003,0.0002,0.0002,0.0002,0.0002,0.0001,0.0001,0.0001,0.0000; ...
    0.0000,0.0001,0.0002,0.0003,0.0004,0.0004,0.0005,0.0006,0.0006,0.0006,0.0006,0.0006,0.0005,0.0005,0.0004,0.0003,0.0003,0.0002,0.0001,0.0000; ...
    0.0000,0.0002,0.0003,0.0005,0.0006,0.0008,0.0009,0.0009,0.0010,0.0010,0.0010,0.0009,0.0008,0.0008,0.0007,0.0006,0.0004,0.0003,0.0002,0.0000; ...
    0.0000,0.0003,0.0005,0.0008,0.0010,0.0012,0.0014,0.0015,0.0015,0.0015,0.0015,0.0014,0.0013,0.0011,0.0010,0.0008,0.0006,0.0005,0.0003,0.0000; ...
    0.0000,0.0004,0.0009,0.0013,0.0016,0.0019,0.0021,0.0023,0.0023,0.0023,0.0021,0.0020,0.0018,0.0016,0.0013,0.0011,0.0009,0.0007,0.0004,0.0000; ...
    0.0000,0.0007,0.0014,0.0020,0.0025,0.0030,0.0033,0.0034,0.0034,0.0033,0.0031,0.0028,0.0025,0.0022,0.0018,0.0015,0.0012,0.0009,0.0006,0.0000; ...
    0.0000,0.0011,0.0021,0.0031,0.0039,0.0045,0.0049,0.0051,0.0050,0.0047,0.0043,0.0039,0.0034,0.0029,0.0024,0.0019,0.0015,0.0011,0.0007,0.0000; ...
    0.0000,0.0017,0.0033,0.0048,0.0060,0.0069,0.0074,0.0074,0.0072,0.0066,0.0059,0.0052,0.0045,0.0037,0.0031,0.0025,0.0019,0.0014,0.0009,0.0000; ...
    0.0000,0.0025,0.0050,0.0073,0.0091,0.0104,0.0109,0.0107,0.0101,0.0091,0.0080,0.0068,0.0057,0.0047,0.0038,0.0030,0.0023,0.0017,0.0011,0.0000; ...
    0.0000,0.0038,0.0075,0.0110,0.0136,0.0153,0.0157,0.0151,0.0138,0.0121,0.0104,0.0087,0.0071,0.0058,0.0046,0.0036,0.0027,0.0019,0.0012,0.0000; ...
    0.0000,0.0055,0.0110,0.0160,0.0198,0.0218,0.0219,0.0205,0.0182,0.0155,0.0129,0.0106,0.0085,0.0068,0.0053,0.0041,0.0031,0.0022,0.0014,0.0000; ...
    0.0000,0.0077,0.0154,0.0224,0.0276,0.0299,0.0293,0.0266,0.0229,0.0190,0.0154,0.0123,0.0098,0.0077,0.0059,0.0045,0.0034,0.0024,0.0015,0.0000; ...
    0.0000,0.0100,0.0202,0.0295,0.0362,0.0385,0.0368,0.0324,0.0271,0.0219,0.0174,0.0137,0.0107,0.0082,0.0063,0.0048,0.0035,0.0025,0.0016,0.0000; ...
    0.0000,0.0120,0.0244,0.0356,0.0432,0.0455,0.0426,0.0366,0.0298,0.0236,0.0184,0.0143,0.0110,0.0084,0.0064,0.0048,0.0035,0.0025,0.0016,0.0000; ...
    0.0000,0.0134,0.0266,0.0382,0.0461,0.0480,0.0445,0.0376,0.0301,0.0235,0.0181,0.0139,0.0106,0.0081,0.0061,0.0046,0.0033,0.0023,0.0015,0.0000; ...
    0.0000,0.0151,0.0261,0.0362,0.0436,0.0447,0.0412,0.0347,0.0276,0.0214,0.0164,0.0125,0.0095,0.0072,0.0054,0.0041,0.0029,0.0021,0.0013,0.0000; ...
    0.0000,0.0174,0.0220,0.0295,0.0349,0.0361,0.0333,0.0281,0.0225,0.0175,0.0134,0.0102,0.0078,0.0059,0.0044,0.0033,0.0024,0.0017,0.0010,0.0000; ...
    0.0000,0.0097,0.0152,0.0200,0.0235,0.0244,0.0227,0.0193,0.0156,0.0122,0.0094,0.0072,0.0055,0.0041,0.0031,0.0023,0.0017,0.0012,0.0007,0.0000; ...
    0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000 ]';
%
%  Normalize to get an integral of 1.
%
  total = sum ( sum ( pdf(1:20,1:20) ) );

  pdf(1:20,1:20) = pdf(1:20,1:20) / total;

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
%    08 February 2010
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
  end
%
%  Write the data.
%
%  For smaller data files, and less precision, try:
%
%     fprintf ( output_unit, '  %14.6e', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16e', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function [ r, seed ] = r8vec_uniform_01 ( n, seed )

%*****************************************************************************80
%
%% R8VEC_UNIFORM_01 returns a unit pseudorandom R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Linus Schrage,
%    A Guide to Simulation,
%    Second Edition,
%    Springer, 1987,
%    ISBN: 0387964673,
%    LC: QA76.9.C65.B73.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, December 1986, pages 362-376.
%
%    Pierre L'Ecuyer,
%    Random Number Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley, 1998,
%    ISBN: 0471134031,
%    LC: T57.62.H37.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, Number 2, 1969, pages 136-143.
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real R(N), the vector of pseudorandom values.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  r = zeros(n,1);

  i4_huge = 2147483647;

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_UNIFORM_01 - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8VEC_UNIFORM_01 - Fatal error!' );
  end

  for i = 1 : n

    k = floor ( seed / 127773 );

    seed = 16807 * ( seed - k * 127773 ) - k * 2836;

    if ( seed < 0 )
      seed = seed + i4_huge;
    end

    r(i) = seed * 4.656612875E-10;

  end

  return
end
function cdf = set_discrete_cdf ( pdf )

%*****************************************************************************80
%
%% SET_DISCRETE_PDF sets a CDF from a discrete PDF.
%
%  Discussion:
%
%    Here, we proceed from cell (1,1) to (2,1) to (20,1), (1,2), (2,2)...(20,20).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real PDF(20,20), the discrete PDF for the cell (I,J),
%    normalized so that the sum over all cells is 1.
%
%    Output, real CDF(20,20), the discrete CDF for the cell (I,J).
%    CDF(20,20) should be 1.
%
  total = 0.0;
  for j = 1 : 20
    for i = 1 : 20
      total = total + pdf(i,j);
      cdf(i,j) = total;
    end
  end

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
