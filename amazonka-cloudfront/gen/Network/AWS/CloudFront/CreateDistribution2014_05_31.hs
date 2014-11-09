{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE NoImplicitPrelude          #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE RecordWildCards            #-}
{-# LANGUAGE TypeFamilies               #-}

-- {-# OPTIONS_GHC -fno-warn-unused-imports #-}
-- {-# OPTIONS_GHC -fno-warn-unused-binds  #-} doesnt work if wall is used
{-# OPTIONS_GHC -w #-}

-- Module      : Network.AWS.CloudFront.CreateDistribution2014_05_31
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Create a new distribution.
module Network.AWS.CloudFront.CreateDistribution2014_05_31
    (
    -- * Request
      CreateDistribution
    -- ** Request constructor
    , createDistribution
    -- ** Request lenses
    , cdDistributionConfig

    -- * Response
    , CreateDistributionResult
    -- ** Response constructor
    , createDistributionResult
    -- ** Response lenses
    , cdrDistribution
    , cdrETag
    , cdrLocation
    ) where

import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.CloudFront.Types

newtype CreateDistribution = CreateDistribution
    { _cdDistributionConfig :: DistributionConfig
    } deriving (Eq, Show, Generic)

-- | 'CreateDistribution' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cdDistributionConfig' @::@ 'DistributionConfig'
--
createDistribution :: DistributionConfig -- ^ 'cdDistributionConfig'
                   -> CreateDistribution
createDistribution p1 = CreateDistribution
    { _cdDistributionConfig = p1
    }

-- | The distribution's configuration information.
cdDistributionConfig :: Lens' CreateDistribution DistributionConfig
cdDistributionConfig =
    lens _cdDistributionConfig (\s a -> s { _cdDistributionConfig = a })

instance ToPath CreateDistribution where
    toPath = const "/2014-05-31/distribution"

instance ToQuery CreateDistribution where
    toQuery = const mempty

instance ToHeaders CreateDistribution

instance ToBody CreateDistribution where
    toBody = toBody . encodeXML . _cdDistributionConfig

data CreateDistributionResult = CreateDistributionResult
    { _cdrDistribution :: Maybe Distribution
    , _cdrETag         :: Maybe Text
    , _cdrLocation     :: Maybe Text
    } deriving (Eq, Show, Generic)

-- | 'CreateDistributionResult' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cdrDistribution' @::@ 'Maybe' 'Distribution'
--
-- * 'cdrETag' @::@ 'Maybe' 'Text'
--
-- * 'cdrLocation' @::@ 'Maybe' 'Text'
--
createDistributionResult :: CreateDistributionResult
createDistributionResult = CreateDistributionResult
    { _cdrDistribution = Nothing
    , _cdrLocation     = Nothing
    , _cdrETag         = Nothing
    }

-- | The distribution's information.
cdrDistribution :: Lens' CreateDistributionResult (Maybe Distribution)
cdrDistribution = lens _cdrDistribution (\s a -> s { _cdrDistribution = a })

-- | The current version of the distribution created.
cdrETag :: Lens' CreateDistributionResult (Maybe Text)
cdrETag = lens _cdrETag (\s a -> s { _cdrETag = a })

-- | The fully qualified URI of the new distribution resource just created.
-- For example:
-- https://cloudfront.amazonaws.com/2010-11-01/distribution/EDFDVBD632BHDS5.
cdrLocation :: Lens' CreateDistributionResult (Maybe Text)
cdrLocation = lens _cdrLocation (\s a -> s { _cdrLocation = a })

instance AWSRequest CreateDistribution where
    type Sv CreateDistribution = CloudFront
    type Rs CreateDistribution = CreateDistributionResult

    request  = post
    response = const . xmlResponse $ \h x -> CreateDistributionResult
        <$> x %| "Distribution"
        <*> h ~:? "ETag"
        <*> h ~:? "Location"
