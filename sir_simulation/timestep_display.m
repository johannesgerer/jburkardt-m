function timestep_display ( m, n, a, k, t )

%*****************************************************************************80
%
%% TIMESTEP_DISPLAY displays the SIR status of all patients at one timestep.
%
%  Discussion:
%
%    We assume that a hospital ward comprises an array of M by N beds.
%
%    The status of each patient is recorded as an integer in an array A.
%
%    Susceptible patients, with a status of 0, have never had the disease.
%
%    Infected patients, with a positive status between 1 and K, have
%    had the disease for A(I,J) days.
%
%    Recovered patients, with a status of -1, have had the disease for K
%    days, are no longer infected, and cannot get the disease again.
%
%    The dynamics for how the disease starts and spreads are handled elsewhere.
%    This routine simply displays the patient status on a given day.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Dianne O'Leary,
%    Models of Infection: Person to Person,
%    Computing in Science and Engineering,
%    Volume 6, Number 1, January/February 2004.
%
%    Dianne OLeary,
%    Scientific Computing with Case Studies,
%    SIAM, 2008,
%    ISBN13: 978-0-898716-66-5,
%    LC: QA401.O44.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of beds.
%
%    Input, integer A(M,N), the status of each patient:
%     0, "Susceptible", display as WHITE.
%     1 through K, "Infected", display as shades of RED.
%    -1, "Recovered", display as GRAY.
%
%    Input, integer K, the maximum number of days of infection.
%
%    Input, integer T, the index of the current day.
%

%
%  Clear the graphics frame.
%
  clf
%
%  Determine the plot range.
%
  margin = 0.05;

  x_axes_min = 1.0 - 0.5 - margin;
  x_axes_max = m   + 0.5 + margin;
  y_axes_min = 1.0 - 0.5 - margin;
  y_axes_max = n   + 0.5 + margin;
%
%  Fill in the background with black.
%
  x1 = x_axes_min;
  x2 = x_axes_max;
  y1 = y_axes_min;
  y2 = y_axes_max;

  rgb = [ 0.0, 0.0, 0.0 ];

  fill ( [ x1, x2, x2, x1 ], [ y1, y1, y2, y2 ], rgb );
  hold on
%
%  Draw a square, representing the bed,
%  with most of the length and width, centered at (I,J).
%
%  Recovered patients have a light gray bed.
%  Suspectible patients have a green bed.
%  Infected patients are very red on the first day, then fade to gray.
%
  for i = 1 : m
    for j = 1 : n

      x1 = i - 0.47;
      x2 = i + 0.47;
      y1 = j - 0.47;
      y2 = j + 0.47;

      if ( a(i,j) == -1 )
        rgb = [ 0.8, 0.8, 0.8 ];
      elseif ( a(i,j) == 0 )
        rgb = [ 0.0, 0.8, 0.0 ];
      else
        rgb = ( ( k + 1 - a(i,j) ) * [1.0, 0.0, 0.0]   ...
              + (         a(i,j) ) * [0.8, 0.8, 0.8] ) ...
              / ( k + 1 );
      end

      fill ( [ x1, x2, x2, x1 ], [ y1, y1, y2, y2 ], rgb );
      hold on

    end
  end
%
%  Make a title.
%
  title_string = sprintf ( 'Patient status at day T = %d', t );

  title ( title_string )
%
%  Choose the aspect ratio and other plot details.
%
  axis ( [ x_axes_min, x_axes_max, y_axes_min, y_axes_max] );
  axis equal
  axis tight

  hold off

  input ( 'Press return' );

  return
end
