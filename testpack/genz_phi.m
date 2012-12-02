function value = genz_phi ( z )

%*****************************************************************************80
%
%% GENZ_PHI estimates the normal cumulative density function.
%
%  Discussion:
%
%    The approximation is accurate to 1.0E-07.
%
%    This routine is based upon algorithm 5666 for the error function,
%    from Hart et al.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 March 2007
%
%  Author:
%
%    Alan Miller
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    John Hart, Ward Cheney, Charles Lawson, Hans Maehly,
%    Charles Mesztenyi, John Rice, Henry Thatcher,
%    Christoph Witzgall,
%    Computer Approximations,
%    Wiley, 1968,
%    LC: QA297.C64.
%
%  Parameters:
%
%    Input, real Z, a value which can be regarded as the distance,
%    in standard deviations, from the mean.
%
%    Output, real VALUE, the integral of the normal PDF from negative
%    infinity to Z.
%
%  Local parameters:
%
%    Local, real ROOTPI, despite the name, is actually the 
%    square root of TWO * pi.
%
  p0 = 220.2068679123761;
  p1 = 221.2135961699311;
  p2 = 112.0792914978709;
  p3 = 33.91286607838300;
  p4 = 6.373962203531650;
  p5 = 0.7003830644436881;
  p6 = 0.03526249659989109;
  q0 = 440.4137358247522;
  q1 = 793.8265125199484;
  q2 = 637.3336333788311;
  q3 = 296.5642487796737;
  q4 = 86.78073220294608;
  q5 = 16.06417757920695;
  q6 = 1.755667163182642;
  q7 = 0.08838834764831844;
  rootpi = 2.506628274631001;

  zabs = abs ( z );
%
%  12 < |Z|.
%
  if ( 12.0 < zabs )

    p = 0.0;

  else
%
%  |Z| <= 12
%
    expntl = exp ( - zabs * zabs / 2.0 );
%
%  |Z| < 7
%
    if ( zabs < 7.0 )

      p = expntl * (((((( ...
                  p6 ...
         * zabs + p5 ) ...
         * zabs + p4 ) ...
         * zabs + p3 ) ...
         * zabs + p2 ) ...
         * zabs + p1 ) ...
         * zabs + p0 ) / ((((((( ...
                  q7 ...
         * zabs + q6 ) ...
         * zabs + q5 ) ...
         * zabs + q4 ) ...
         * zabs + q3 ) ...
         * zabs + q2 ) ...
         * zabs + q1 ) ...
         * zabs + q0 );
%
%  CUTOFF <= |Z|
%
    else

      p = expntl / ( ...
        zabs + 1.0 / ( ...
        zabs + 2.0 / ( ...
        zabs + 3.0 / ( ...
        zabs + 4.0 / ( ...
        zabs + 0.65 ))))) / rootpi;

    end

  end

  if ( 0.0 < z )
    p = 1.0 - p;
  end

  value = p;

  return
end
