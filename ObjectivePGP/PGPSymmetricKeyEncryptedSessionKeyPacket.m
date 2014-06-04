//
//  PGPSymmetricKeyEncryptedSessionKeyPacket.m
//  ObjectivePGP
//
//  Created by Marcin Krzyzanowski on 04/06/14.
//  Copyright (c) 2014 Marcin Krzyżanowski. All rights reserved.
//

#import "PGPSymmetricKeyEncryptedSessionKeyPacket.h"

@implementation PGPSymmetricKeyEncryptedSessionKeyPacket

- (PGPPacketTag)tag
{
    return PGPSymetricKeyEncryptedSessionKeyPacketTag;
}

- (NSUInteger)parsePacketBody:(NSData *)packetBody error:(NSError *__autoreleasing *)error
{
    NSUInteger position = [super parsePacketBody:packetBody error:error];

    // - A one-octet version number.  The only currently defined version is 4.
    [packetBody getBytes:&_version range:(NSRange) {position, sizeof(_version)}];
    position = position + 1;

    // - A one-octet number describing the symmetric algorithm used.
    [packetBody getBytes:&_symmetricAlgorithm range:(NSRange) {position, sizeof(_symmetricAlgorithm)}];
    position = position + 1;

    // - A string-to-key (S2K) specifier, length as defined above.
    [packetBody getBytes:&_specifier range:(NSRange) {position, sizeof(_specifier)}];
    position = position + 1;

    // - Optionally, the encrypted session key itself, which is decrypted with the string-to-key object.

    return position;
}

@end
