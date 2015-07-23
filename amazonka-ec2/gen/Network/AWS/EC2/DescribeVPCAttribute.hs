{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.DescribeVPCAttribute
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Describes the specified attribute of the specified VPC. You can specify
-- only one attribute at a time.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeVPCAttribute.html>
module Network.AWS.EC2.DescribeVPCAttribute
    (
    -- * Request
      DescribeVPCAttribute
    -- ** Request constructor
    , describeVPCAttribute
    -- ** Request lenses
    , dvpcarqAttribute
    , dvpcarqDryRun
    , dvpcarqVPCId

    -- * Response
    , DescribeVPCAttributeResponse
    -- ** Response constructor
    , describeVPCAttributeResponse
    -- ** Response lenses
    , dvpcarsEnableDNSHostnames
    , dvpcarsEnableDNSSupport
    , dvpcarsVPCId
    , dvpcarsStatus
    ) where

import           Network.AWS.EC2.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'describeVPCAttribute' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dvpcarqAttribute'
--
-- * 'dvpcarqDryRun'
--
-- * 'dvpcarqVPCId'
data DescribeVPCAttribute = DescribeVPCAttribute'
    { _dvpcarqAttribute :: !(Maybe VPCAttributeName)
    , _dvpcarqDryRun    :: !(Maybe Bool)
    , _dvpcarqVPCId     :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DescribeVPCAttribute' smart constructor.
describeVPCAttribute :: Text -> DescribeVPCAttribute
describeVPCAttribute pVPCId_ =
    DescribeVPCAttribute'
    { _dvpcarqAttribute = Nothing
    , _dvpcarqDryRun = Nothing
    , _dvpcarqVPCId = pVPCId_
    }

-- | The VPC attribute.
dvpcarqAttribute :: Lens' DescribeVPCAttribute (Maybe VPCAttributeName)
dvpcarqAttribute = lens _dvpcarqAttribute (\ s a -> s{_dvpcarqAttribute = a});

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
dvpcarqDryRun :: Lens' DescribeVPCAttribute (Maybe Bool)
dvpcarqDryRun = lens _dvpcarqDryRun (\ s a -> s{_dvpcarqDryRun = a});

-- | The ID of the VPC.
dvpcarqVPCId :: Lens' DescribeVPCAttribute Text
dvpcarqVPCId = lens _dvpcarqVPCId (\ s a -> s{_dvpcarqVPCId = a});

instance AWSRequest DescribeVPCAttribute where
        type Sv DescribeVPCAttribute = EC2
        type Rs DescribeVPCAttribute =
             DescribeVPCAttributeResponse
        request = post
        response
          = receiveXML
              (\ s h x ->
                 DescribeVPCAttributeResponse' <$>
                   (x .@? "enableDnsHostnames") <*>
                     (x .@? "enableDnsSupport")
                     <*> (x .@? "vpcId")
                     <*> (pure (fromEnum s)))

instance ToHeaders DescribeVPCAttribute where
        toHeaders = const mempty

instance ToPath DescribeVPCAttribute where
        toPath = const "/"

instance ToQuery DescribeVPCAttribute where
        toQuery DescribeVPCAttribute'{..}
          = mconcat
              ["Action" =: ("DescribeVPCAttribute" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "Attribute" =: _dvpcarqAttribute,
               "DryRun" =: _dvpcarqDryRun, "VpcId" =: _dvpcarqVPCId]

-- | /See:/ 'describeVPCAttributeResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dvpcarsEnableDNSHostnames'
--
-- * 'dvpcarsEnableDNSSupport'
--
-- * 'dvpcarsVPCId'
--
-- * 'dvpcarsStatus'
data DescribeVPCAttributeResponse = DescribeVPCAttributeResponse'
    { _dvpcarsEnableDNSHostnames :: !(Maybe AttributeBooleanValue)
    , _dvpcarsEnableDNSSupport   :: !(Maybe AttributeBooleanValue)
    , _dvpcarsVPCId              :: !(Maybe Text)
    , _dvpcarsStatus             :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DescribeVPCAttributeResponse' smart constructor.
describeVPCAttributeResponse :: Int -> DescribeVPCAttributeResponse
describeVPCAttributeResponse pStatus_ =
    DescribeVPCAttributeResponse'
    { _dvpcarsEnableDNSHostnames = Nothing
    , _dvpcarsEnableDNSSupport = Nothing
    , _dvpcarsVPCId = Nothing
    , _dvpcarsStatus = pStatus_
    }

-- | Indicates whether the instances launched in the VPC get DNS hostnames.
-- If this attribute is @true@, instances in the VPC get DNS hostnames;
-- otherwise, they do not.
dvpcarsEnableDNSHostnames :: Lens' DescribeVPCAttributeResponse (Maybe AttributeBooleanValue)
dvpcarsEnableDNSHostnames = lens _dvpcarsEnableDNSHostnames (\ s a -> s{_dvpcarsEnableDNSHostnames = a});

-- | Indicates whether DNS resolution is enabled for the VPC. If this
-- attribute is @true@, the Amazon DNS server resolves DNS hostnames for
-- your instances to their corresponding IP addresses; otherwise, it does
-- not.
dvpcarsEnableDNSSupport :: Lens' DescribeVPCAttributeResponse (Maybe AttributeBooleanValue)
dvpcarsEnableDNSSupport = lens _dvpcarsEnableDNSSupport (\ s a -> s{_dvpcarsEnableDNSSupport = a});

-- | The ID of the VPC.
dvpcarsVPCId :: Lens' DescribeVPCAttributeResponse (Maybe Text)
dvpcarsVPCId = lens _dvpcarsVPCId (\ s a -> s{_dvpcarsVPCId = a});

-- | FIXME: Undocumented member.
dvpcarsStatus :: Lens' DescribeVPCAttributeResponse Int
dvpcarsStatus = lens _dvpcarsStatus (\ s a -> s{_dvpcarsStatus = a});