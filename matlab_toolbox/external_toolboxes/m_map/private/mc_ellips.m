function MAP_ELLIP=mc_ellips();
%
% Definitions of different ellipsoids
%

% Rich Pawlowicz (rich@ocgy.ubc.ca)

MAP_ELLIP = struct ( ...
    'normal', [1.0,       0], ...
    'sphere', [6370997.0, 0], ...
    'grs80' , [6378137.0, 1/298.257], ...
    'grs67' , [6378160.0, 1/247.247], ...
    'wgs84' , [6378137.0, 1/298.257], ...
    'wgs72' , [6378135.0, 1/298.260], ...
    'wgs66' , [6378145.0, 1/298.250], ...
    'wgs60' , [6378165.0, 1/298.300], ...
    'clrk66', [6378206.4, 1/294.97870], ...
    'clrk80', [6378249.1, 1/293.466], ...
    'intl24', [6378388.0, 1/297.000], ...
    'intl67', [6378157.5, 1/298.250]);
