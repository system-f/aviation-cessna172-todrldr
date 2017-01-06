{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}

module Data.Aviation.C172.TakeoffLanding(
  C172ShortFieldChart(..)
, TakeOffDistance(..)
, c172s_2550lbs_groundroll_takeoff
, c172s_2550lbs_50ft_takeoff
, c172s_2550lbs_groundroll_landing
, c172s_2550lbs_50ft_landing
, PressureAltitude
, AsPressureAltitude(..)
, Temperature
, AsTemperature(..)
, intervalsPressureAltitude
, intervalsTemperature
, distancerequired
) where

import Control.Category(id)
import Control.Lens(makeClassy, Prism', prism')
import Data.Bool((||))
import Data.Eq(Eq)
import Data.Int(Int)
import Data.Maybe(Maybe(Just, Nothing))
import Data.Ord(Ord((>), (<)))
import Prelude(Show, Rational, fromIntegral, (+), (*), (-), (/), error, divMod)

data C172ShortFieldChart =
  C172ShortFieldChart {
    _temp00 ::
      Int
  , _temp10 ::
      Int
  , _temp20 ::
      Int
  , _temp30 ::
      Int
  , _temp40 ::
      Int
  }
  deriving (Eq, Ord, Show)

makeClassy ''C172ShortFieldChart

data TakeOffDistance =
  TakeOffDistance {
    _pa0000 ::
      C172ShortFieldChart
  , _pa1000 ::
      C172ShortFieldChart
  , _pa2000 ::
      C172ShortFieldChart
  , _pa3000 ::
      C172ShortFieldChart
  , _pa4000 ::
      C172ShortFieldChart
  , _pa5000 ::
      C172ShortFieldChart
  , _pa6000 ::
      C172ShortFieldChart
  , _pa7000 ::
      C172ShortFieldChart
  , _pa8000 ::
      C172ShortFieldChart
  }
  deriving (Eq, Ord, Show)

makeClassy ''TakeOffDistance

c172s_2550lbs_groundroll_takeoff ::
  TakeOffDistance
c172s_2550lbs_groundroll_takeoff =
  TakeOffDistance
    (
      C172ShortFieldChart
        860
        925
        995
        1070
        1150
    )
    (
      C172ShortFieldChart
        940
        1010
        1090
        1170
        1260
    )
    (
      C172ShortFieldChart
        1025
        1110
        1195
        1285
        1380
    )
    (
      C172ShortFieldChart
        1125
        1215
        1310
        1410
        1515
    )
    (
      C172ShortFieldChart
        1235
        1335
        1440
        1550
        1660
    )
    (
      C172ShortFieldChart
        1355
        1465
        1585
        1705
        1825
    )
    (
      C172ShortFieldChart
        1495
        1615
        1745
        1875
        2010
    )
    (
      C172ShortFieldChart
        1645
        1785
        1920
        2065
        2215
    )
    (
      C172ShortFieldChart
        1820
        1970
        2120
        2280
        2450
    )

c172s_2550lbs_50ft_takeoff ::
  TakeOffDistance
c172s_2550lbs_50ft_takeoff =
  TakeOffDistance
    (
      C172ShortFieldChart
        1465
        1575
        1690
        1810
        1945
    )
    (
      C172ShortFieldChart
        1600
        1720
        1850
        1990
        2135
    )
    (
      C172ShortFieldChart
        1755
        1890
        2035
        2190
        2355
    )
    (
      C172ShortFieldChart
        1925
        2080
        2240
        2420
        2605
    )
    (
      C172ShortFieldChart
        2120
        2295
        2480
        2685
        2880
    )
    (
      C172ShortFieldChart
        2345
        2545
        2755
        2975
        3205
    )
    (
      C172ShortFieldChart
        2605
        2830
        3075
        3320
        3585
    )
    (
      C172ShortFieldChart
        2910
        3170
        3440
        3730
        4045
    )
    (
      C172ShortFieldChart
        3265
        3575
        3880
        4225
        4615
    )

c172s_2550lbs_groundroll_landing ::
  TakeOffDistance
c172s_2550lbs_groundroll_landing =
  TakeOffDistance
    (
      C172ShortFieldChart
        545
        565
        585
        605
        625
    )
    (
      C172ShortFieldChart
        565
        585
        605
        625
        650
    )
    (
      C172ShortFieldChart
        585
        610
        630
        650
        670
    )
    (
      C172ShortFieldChart
        610
        630
        655
        675
        695
    )
    (
      C172ShortFieldChart
        630
        655
        675
        700
        725
    )
    (
      C172ShortFieldChart
        655
        680
        705
        725
        750
    )
    (
      C172ShortFieldChart
        680
        705
        730
        755
        780
    )
    (
      C172ShortFieldChart
        705
        730
        760
        785
        810
    )
    (
      C172ShortFieldChart
        735
        760
        790
        815
        840
    )

c172s_2550lbs_50ft_landing ::
  TakeOffDistance
c172s_2550lbs_50ft_landing =
  TakeOffDistance
    (
      C172ShortFieldChart
        1290
        1320
        1350
        1380
        1415
    )
    (
      C172ShortFieldChart
        1320
        1350
        1385
        1420
        1450
    )
    (
      C172ShortFieldChart
        1355
        1385
        1420
        1455
        1490
    )
    (
      C172ShortFieldChart
        1385
        1425
        1460
        1495
        1530
    )
    (
      C172ShortFieldChart
        1425
        1460
        1495
        1535
        1570
    )
    (
      C172ShortFieldChart
        1460
        1500
        1535
        1575
        1615
    )
    (
      C172ShortFieldChart
        1500
        1540
        1580
        1620
        1660
    )
    (
      C172ShortFieldChart
        1545
        1585
        1625
        1665
        1705
    )
    (
      C172ShortFieldChart
        1585
        1630
        1670
        1715
        1755
    )

newtype PressureAltitude =
  PressureAltitude
    Int
  deriving (Eq, Ord, Show)

class AsPressureAltitude r0 where
  _PressureAltitude ::
    Prism' r0 PressureAltitude

instance AsPressureAltitude PressureAltitude where
  _PressureAltitude =
    id

instance AsPressureAltitude Int where
  _PressureAltitude =
    prism'
      (\(PressureAltitude n) -> n)
      (\n -> if n < 0 || n > 8000
               then
                 Nothing
              else
                 Just (PressureAltitude n))

newtype Temperature =
  Temperature
    Int
  deriving (Eq, Ord, Show)

class AsTemperature r0 where
  _Temperature ::
    Prism' r0 Temperature

instance AsTemperature Temperature where
  _Temperature =
    id

instance AsTemperature Int where
  _Temperature =
    prism'
      (\(Temperature n) -> n)
      (\n -> if n < 0 || n > 40
               then
                 Nothing
              else
                 Just (Temperature n))


intervalsPressureAltitude ::
  PressureAltitude
  -> TakeOffDistance
  -> (C172ShortFieldChart, C172ShortFieldChart, Int)
intervalsPressureAltitude (PressureAltitude n) (TakeOffDistance _0 _1 _2 _3 _4 _5 _6 _7 _8) =
  let (d, m) =
        n `divMod` 1000
      (r, s) =
        case d of
          0 ->
            (_0, _1)
          1 ->
            (_1, _2)
          2 ->
            (_2, _3)
          3 ->
            (_3, _4)
          4 ->
            (_4, _5)
          5 ->
            (_5, _6)
          6 ->
            (_6, _7)
          7 ->
            (_7, _8)
          8 ->
            (_7, _8)
          _ ->
            error "TODO"
  in  (r, s, m)

intervalsTemperature ::
  Temperature
  -> C172ShortFieldChart
  -> (Int, Int, Int)
intervalsTemperature (Temperature n) (C172ShortFieldChart _0 _1 _2 _3 _4) =
  let (d, m) =
        n `divMod` 10
      (r, s) =
        case d of
          0 ->
            (_0, _1)
          1 ->
            (_1, _2)
          2 ->
            (_2, _3)
          3 ->
            (_3, _4)
          4 ->
            (_3, _4)
          _ -> 
            error "TODO"          
  in  (r, s, m)

-- distancerequired (PressureAltitude 100) (Temperature 10) c172s_2550lbs_groundroll_takeoff

-- |
--
-- >>> distancerequired (PressureAltitude 3500) (Temperature 25) c172s_2550lbs_groundroll_takeoff
-- 2855 % 2
--
-- >>> distancerequired (PressureAltitude 3000) (Temperature 20) c172s_2550lbs_groundroll_takeoff
-- 1310 % 1
--
-- >>> distancerequired (PressureAltitude 3000) (Temperature 25) c172s_2550lbs_groundroll_takeoff
-- 1360 % 1
--
-- >>> distancerequired (PressureAltitude 3500) (Temperature 20) c172s_2550lbs_groundroll_takeoff
-- 1375 % 1
--
-- >>> distancerequired (PressureAltitude 3250) (Temperature 27) c172s_2550lbs_groundroll_takeoff
-- 5657 % 4
--
-- >>> distancerequired (PressureAltitude 5130) (Temperature 14) c172s_2550lbs_groundroll_takeoff
-- 76651 % 50
distancerequired ::
  PressureAltitude
  -> Temperature
  -> TakeOffDistance
  -> Rational
distancerequired e b chart =
  let (x,  y,  q) = intervalsPressureAltitude e chart
      (x0, y0, r) = intervalsTemperature b x
      (x1, y1, _) = intervalsTemperature b y
      normpa g h  = fromIntegral ((h - g) * q) / 1000 + fromIntegral g
      normtp g h  = (h - g) * fromIntegral r / 10 + g
  in  normtp (normpa x0 x1) (normpa y0 y1)
