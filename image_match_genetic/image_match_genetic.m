function image_match_genetic ( image_filename )

%*****************************************************************************80
%
%% IMAGE_MATCH_GENETIC approximates an image with 32 colored rectangles.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Nick Berry,
%    A "Practical" Use for Genetic Programming,
%    http://www.datagenetics.com/blog.html
%
%  Parameters:
%
%    Input, string IMAGE_FILENAME, the name of the file containing the
%    256x256 JPG image.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'IMAGE_MATCH_GENETIC:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Approximate a 256x256 JPG image using a genetic algorithm.\n' );
  fprintf ( 1, '  Just 32 colored rectangles are allowed.\n' );
  fprintf ( 1, '  Each rectangle has a uniform RGB color,\n' );
  fprintf ( 1, '  and a lower left and upper right coordinate.\n' );
  fprintf ( 1, '  The color of overlapping rectangles is blended.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A genetic algorithm starts with several candidate solutions\n' );
  fprintf ( 1, '  and a fitness function which identifies the best one.\n' );
  fprintf ( 1, '  The worst candidates die, the best reproduce, and a random\n' );
  fprintf ( 1, '  mutation is also applied.\n' );
  fprintf ( 1, '  By repeating this process, a sequence of improved candidates is found.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This program is based on an example by Nick Berry.\n' );

  close all

  if ( nargin < 1 )
    image_filename = input ( '  Enter jpg image filename, in ''quotes'': ' );
  end
%
%  A is a 256x256x3 array of "uint8" values between 0 and 255.
%  These are the RGB values for the image.
%
  a = imread ( image_filename );
  figure ( 1 );
  clf
  imshow ( image_filename );
  title ( 'Image to match', 'FontSize', 16 );

  [ m, n, k ] = size ( a );
%
%  Generate an initial population of 10 candidates.
%
  dna_num = 10;
  dna = zeros ( 56, 32, dna_num );
  for j = 1 : dna_num
    dna(1:56,1:32,j) = dna_random ( );
  end
%
%  EVOLUTION LOOP BEGINS
%
  score_sofar = Inf;
  step = 0;
  step_max = 10000;

  while ( 1 )
%
%  Create the RGB array corresponding to each set of DNA, 
%  determine the scores.
%
    score = zeros ( dna_num, 1 );
    for j = 1 : dna_num
      rgb = dna_to_rgb_average ( dna(1:56,1:32,j) );
%     rgb = dna_to_rgb_max ( dna(1:56,1:32,j) );
      score(j) = rgb_fitness ( 256, 256, 3, a, rgb );
    end

    score_min = Inf;
    score_index = 0;
    for j = 1 : dna_num
      if ( score(j) < score_min )
        score_min = score(j);
        score_ndx = j;
      end
    end
 
    if ( score_min < score_sofar )
      fprintf ( 1, '  %6d  %2d  %12d\n', step, score_ndx, score_min )
      score_sofar = score_min;
    end
%
%  Reorder the DNA so lowest (best) scores are first.
%
    for j = 1 : dna_num - 1
      for k = j + 1 : dna_num

        if ( score(k) < score(j) )

          t        = score(k);
          score(k) = score(j);
          score(j) = t;

          t = dna(1:56,1:32,k);
          dna(1:56,1:32,k) = dna(1:56,1:32,j);
          dna(1:56,1:32,j) = t;

        end

      end
    end

    if ( step == 0 )
      filename = 'best0.txt';
      i4mat_write ( filename, 56, 32, dna(1:56,1:32,1) );
      rgb = dna_to_rgb_average ( dna(1:56,1:32,1) );
%     rgb = dna_to_rgb_max ( dna(1:56,1:32,1) );
      figure ( 2 )
      rgb_display ( rgb, 'best0' );
    end

    if ( step == 0 )
      figure ( 3 );
      hold on
      axis ( [ 0, step_max, 0, score_min ] )
      plot ( step, score_min, 'b*' )
      grid on
      xlabel ( 'Steps -->', 'FontSize', 16 )
      ylabel ( 'Image Difference', 'FontSize', 16 )
      title ( 'Image Match Progress', 'FontSize', 24 )
      drawnow
    else
      figure ( 3 );
      plot ( step, score_min, 'b*' )
      if ( step == step_max )
        hold off
      end
      drawnow
    end

    if ( step == step_max || mod ( step, 1000 ) == 0 )
      figure ( 4 );
      header = sprintf ( 'best%d', step );
      rgb = dna_to_rgb_average ( dna(1:56,1:32,1) );
%     rgb = dna_to_rgb_max ( dna(1:56,1:32,1) );
      rgb_display ( rgb, header );
    end

    if ( step == step_max )
      filename = sprintf ( 'best%d.txt', step );
      i4mat_write ( filename, 56, 32, dna(1:56,1:32,1) );
    end

    if ( step_max <= step )
      break;
    end

    step = step + 1;
%
%  Hybridize the DNA in two random positions between 1 and 8, and place the results in
%  positions 9 and 10.
%
    j1 = randi ( [ 1, 8 ], 1, 1 );
    j2 = randi ( [ 1, 8 ], 1, 1 );

    if ( j1 == j2 )
      j1 = 1;
      j2 = randi ( [ 2, 8 ], 1, 1 );
    end

    [ dna(1:56,1:32,9), dna(1:56,1:32,10) ] = ...
      dna_hybridize ( 56, 32, dna(1:56,1:32,j1), dna(1:56,1:32,j2) );
%
%  Select a DNA in positions 2 through 8 for mutation.
%
    j = randi ( [ 3, 8 ], 1, 1 );
    dna(1:56,1:32,j) = dna_mutate ( 56, 32, dna(1:56,1:32,j) );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'IMAGE_MATCH_GENETIC:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

