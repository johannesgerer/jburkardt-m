function fft_serial ( )

%*****************************************************************************80
%
%% FFT_SERIAL is the main program.
%
%  Discussion:
%
%    The complex data in an N vector is stored as pairs of values in a
%    real ( kind = 8 ) vector of length 2*N.
%
%  Modified:
%
%    16 May 2009
%
%  Author:
%
%    Original C version by Wesley Petersen.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Wesley Petersen, Peter Arbenz, 
%    Introduction to Parallel Computing - A practical guide with examples in C,
%    Oxford University Press,
%    ISBN: 0-19-851576-6,
%    LC: QA76.58.P47.
%
  nits = 10000;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FFT_SERIAL\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Demonstrate an implementation of the Fast Fourier Transform\n' );
  fprintf ( 1, '  of a complex data vector.\n' );
%
%  Prepare for tests.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Accuracy check:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    FFT ( FFT ( X(1:N) ) ) == N * X(1:N)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '             N      NITS    Error         Time          Time/Call     MFLOPS\n' );
  fprintf ( 1, '\n' );

  seed  = 331.0;
  n = 1;
%
%  LN2 is the log base 2 of N.  Each increase of LN2 doubles N.
%
  for ln2 = 1 : 10

    n = 2 * n;
%
%  Allocate storage for the complex arrays W, X, Y, Z.  
%
%  We handle the complex arithmetic,
%  and store a complex number as a pair of floats, a complex vector as a doubly
%  dimensioned array whose second dimension is 2. 
%
%  I need the extra two entries in X, Y, and Z because there seems to be a slight
%  amount of memory leakage.
%
    w = zeros ( 1, n );
    x = zeros ( 1, 2 * n + 2 );
    y = zeros ( 1, 2 * n + 2 );
    z = zeros ( 1, 2 * n + 2 );

    first = 1;

    for icase = 0 : 1

      if ( first )

        for i = 1 : 2 : 2 * n - 1

          [ z0, seed ] = ggl ( seed );
          [ z1, seed ] = ggl ( seed );
          x(i) = z0;
          z(i) = z0;
          x(i+1) = z1;
          z(i+1) = z1;
        end

      else

        for i = 1 : 2 : 2 * n - 1
          z0 = 0.0;
          z1 = 0.0;
          x(i) = z0;
          z(i) = z0;
          x(i+1) = z1;
          z(i+1) = z1;
        end

      end
%
%  Initialize the sine and cosine tables.
%
      w = cffti ( n );
%
%  Transform forward, back 
%
      if ( first )

        sgn = + 1.0;
        y = cfft2 ( n, x, w, sgn );
        sgn = - 1.0;
        x = cfft2 ( n, y, w, sgn );
% 
%  Results should be same as initial multiplied by n 
%
        fnm1 = 1.0 / n;

        error = 0.0;
        for i = 1 : 2 : 2 * n - 1
          error = error ...
          + ( z(i)   - fnm1 * x(i) )^2 ...
          + ( z(i+1) - fnm1 * x(i+1) )^2;
        end
        error = sqrt ( fnm1 * error );

        first = 0;

      else

        tic;

        for it = 1 : nits

          sgn = + 1.0;
          y = cfft2 ( n, x, w, sgn );
          sgn = - 1.0;
          x = cfft2 ( n, y, w, sgn );

        end

        wtime = toc;

        flops = 2.0 * nits * ( 5.0 * n * ln2 );

        mflops = flops / 1.0E+06 / wtime;

        fprintf ( 1, '  %12d  %8d  %12e  %12e  %12e  %12e\n', ...
          n, nits, error, wtime, wtime / ( 2 * nits ), mflops );

      end

    end

    if ( mod ( ln2, 4 ) == 0 )
      nits = floor ( nits / 10 );
    end

    if ( nits < 1 )
      nits = 1;
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FFT_SERIAL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function y = cfft2 ( n, x, w, sgn )

%*****************************************************************************80
%
%% CFFT2 performs a complex Fast Fourier Transform.
%
%  Modified:
%
%    27 April 2008
%
%  Author:
%
%    Original C version by Wesley Petersen.
%    FORTRAN90 version by John Burkardt.
%
%  Reference:
%
%    Wesley Petersen, Peter Arbenz, 
%    Introduction to Parallel Computing - A practical guide with examples in C,
%    Oxford University Press,
%    ISBN: 0-19-851576-6,
%    LC: QA76.58.P47.
%
%  Parameters:
%
%    Input, integer N, the size of the array to be transformed.
%
%    Input, real X(2*N), the data to be transformed.  
%
%    Input, real W(N), a table of sines and cosines.
%
%    Input, real SGN, is +1 for a "forward" FFT 
%    and -1 for a "backward" FFT.
%
%    Output, real Y(2*N), the forward or backward FFT of X.
%
   m = floor ( ( log ( n ) / log ( 1.99 ) ) );
   mj = 1;
  xoff = 2 * floor ( n / 2 );
%
%  Toggling switch for work array.
%
  tgle = 1;

  yoff = mj * 2;
  y = step ( n, mj, x, w, sgn, xoff, yoff );

  if ( n == 2 )
    return
  end

  for j = 1 : m - 2  

    mj = mj * 2;
    yoff = mj * 2;

    if ( tgle )
      x = step ( n, mj, y, w, sgn, xoff, yoff );
      tgle = 0;
    else
      y = step ( n, mj, x, w, sgn, xoff, yoff );
      tgle = 1;
    end

  end
%
%  Last pass through data: move Y to X if needed. 
%
  if ( tgle )
    x(1:2*n) = y(1:2*n);
  end

  mj = floor ( n / 2 );
  yoff = mj * 2;
  y = step ( n, mj, x, w, sgn, xoff, yoff );

  return
end
function w = cffti ( n )

%*****************************************************************************80
%
%% CFFTI sets up sine and cosine tables needed for the FFT calculation.
%
%  Modified:
%
%    16 May 2009
%
%  Author:
%
%    Original C version by Wesley Petersen.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Wesley Petersen, Peter Arbenz, 
%    Introduction to Parallel Computing - A practical guide with examples in C,
%    Oxford University Press,
%    ISBN: 0-19-851576-6,
%    LC: QA76.58.P47.
%
%  Parameters:
%
%    Input, integer N, the size of the array to be transformed.
%
%    Output, real W(N), a table of sines and cosines.
%
  n2 = floor ( n / 2 );

  for i = 1 : n2
    arg = 2.0 * pi * ( i - 1 ) / n;
    w(2*i-1) = cos ( arg );
    w(2*i)   = sin ( arg );
  end

  return
end
function [ value, seed ] = ggl ( seed )

%*****************************************************************************80
%
%% GGL generates uniformly distributed pseudorandom numbers. 
%
%  Modified:
%
%    16 May 2009
%
%  Author:
%
%    Original C version by Wesley Petersen, M Troyer, I Vattulainen.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Wesley Petersen, Peter Arbenz, 
%    Introduction to Parallel Computing - A practical guide with examples in C,
%    Oxford University Press,
%    ISBN: 0-19-851576-6,
%    LC: QA76.58.P47.
%
%  Parameters:
%
%    Input, real SEED, used as a seed for the sequence.
%
%    Output, real VALUE, the next pseudorandom value.
%
%    Output, real SEED, a seed for the random number generator.
%
  d2 = 0.2147483647E+10;

  t = mod ( 16807.0 * seed, d2 );
  seed = t;
  value = ( t - 1.0 ) / ( d2 - 1.0 );

  return
end
function y = step ( n, mj, x, w, sgn, xoff, yoff )

%*****************************************************************************80
%
%% STEP carries out one step of the workspace version of CFFT2.
%
%  Modified:
%
%    16 May 2009
%
%  Author:
%
%    Original C version by Wesley Petersen.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Wesley Petersen, Peter Arbenz, 
%    Introduction to Parallel Computing - A practical guide with examples in C,
%    Oxford University Press,
%    ISBN: 0-19-851576-6,
%    LC: QA76.58.P47.
%
%  Parameters:
%
  mj2 = 2 * mj;
  lj  = floor ( n / mj2 );

  for j = 0 : lj - 1

    jw = j * mj;
    ja  = jw;
    jb  = ja;
    jc  = j * mj2;
    jd  = jc;

    wjw(1) = w(jw*2+1);
    wjw(2) = w(jw*2+2);

    if ( sgn < 0.0 )
      wjw(2) = - wjw(2);
    end

    for k = 0 : mj - 1

      y((jc+k)*2+1) = x((ja+k)*2+1) + x((jb+k)*2+1+xoff);
      y((jc+k)*2+2) = x((ja+k)*2+2) + x((jb+k)*2+2+xoff);

      ambr = x((ja+k)*2+1) - x((jb+k)*2+1+xoff);
      ambu = x((ja+k)*2+2) - x((jb+k)*2+2+xoff);

      y((jd+k)*2+1+yoff) = wjw(1) * ambr - wjw(2) * ambu;
      y((jd+k)*2+2+yoff) = wjw(2) * ambr + wjw(1) * ambu;

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
