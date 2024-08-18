local Translations = {
    error = {
        ['missing_item'] = 'You Are Missing Something.',
        ['cant_bag'] = 'Use zipties first to use headbag',
        ['cant_zip'] = 'Get closer & must be handsup',
        ['no_zip_item'] = 'Need knife to Cut/Break That !',
        ['none_nearby'] = 'There Is Nobody Nearby.',
        ['vehicle_zip'] = 'You Can\'t Do That Right Now.',
    },
    info = {
        ['wiggle'] = 'You can try to escape do fast',
        ['bagged'] = 'You\'re Head Has Been Covered.',
    },
    released = {
        ['bag_off'] = 'You Can See Again',
        ['wigglebag'] = 'You Wiggled The Bag Off',
        ['zipoff'] = 'You Have Been Released',
        ['wigglezip'] = 'You Wiggled Free',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})