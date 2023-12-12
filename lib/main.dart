import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seven_learn_excersize_two/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '7Learn Exercise 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(primary: Color(0xff176FF2))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffE7E9F3),
            Color(0xffFFFFFF),
          ],
        )),
        child: Scaffold(
          body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            children: const [
              _Header(),
              SizedBox(height: 16),
              _Title(),
              SizedBox(height: 16),
              _Description(),
              SizedBox(height: 32),
              _Facilities(),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Price(),
                  SizedBox(width: 56),
                  Expanded(child: _BookButton()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('asset/image/image.png')),
        const Positioned(left: 12, top: 12, child: _BackButton()),
        const Positioned(right: 14, bottom: -20, child: _LikeButton())
      ],
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffF3F8FE)),
        child: const Icon(
          Icons.keyboard_arrow_left_rounded,
          color: Color(0xffB8B8B8),
        ),
      ),
    );
  }
}

class _LikeButton extends StatelessWidget {
  const _LikeButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xffF2F7FD),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff0038FF).withOpacity(.1),
                offset: const Offset(0, 6),
                blurRadius: 8)
          ]),
      child: SvgPicture.asset('asset/image/Heart.svg'),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Coeurdes Alpes',
              style: GoogleFonts.montserrat()
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Show map',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary)),
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset('asset/image/star.svg'),
            const SizedBox(width: 4),
            const Text('4.5 (355 Reviews)',
                style: TextStyle(fontSize: 12, color: Color(0xff606060)))
          ],
        ),
      ],
    );
  }
}

class _Description extends StatefulWidget {
  const _Description();

  @override
  State<_Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<_Description> {
  bool _readMore = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _readMore ? textSummery : AppStrings.description,
          textAlign: TextAlign.justify,
          style: const TextStyle(color: Color(0xff3A544F), fontSize: 14),
        ),
        _ReadMoreButton(
          readMore: _readMore,
          onTap: () => setState(() => _readMore = !_readMore),
        )
      ],
    );
  }

  String get textSummery =>
      '${AppStrings.description.substring(0, AppStrings.description.length ~/ 5)} ....';
}

class _ReadMoreButton extends StatelessWidget {
  const _ReadMoreButton({required this.readMore, required this.onTap});

  final bool readMore;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextButton.icon(
        onPressed: onTap,
        icon: Icon(readMore
            ? Icons.keyboard_arrow_down_rounded
            : Icons.keyboard_arrow_up_rounded),
        label: Text(readMore ? 'Read more' : 'Read less'),
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
      ),
    );
  }
}

class _Facilities extends StatelessWidget {
  const _Facilities();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Facilities',
          style: GoogleFonts.montserrat()
              .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _FacilityItem(
                icon: SvgPicture.asset('asset/image/heater.svg'),
                title: '1 Heater'),
            _FacilityItem(
                icon: SvgPicture.asset('asset/image/food.svg'),
                title: 'Dinner'),
            _FacilityItem(
                icon: SvgPicture.asset('asset/image/bath.svg'), title: '1 Tub'),
            _FacilityItem(
                icon: SvgPicture.asset('asset/image/pool.svg'), title: 'Pool'),
          ],
        ),
      ],
    );
  }
}

class _FacilityItem extends StatelessWidget {
  const _FacilityItem({required this.icon, required this.title});

  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
          color: const Color(0xffEFF4FC),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(color: Color(0xffB8B8B8), fontSize: 10),
          )
        ],
      ),
    );
  }
}

class _Price extends StatelessWidget {
  const _Price();

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        Text(
          '\$199',
          style: GoogleFonts.montserrat()
              .copyWith(
              color: const Color(0xff2DD7A4),
              fontSize: 24,
              fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}

class _BookButton extends StatelessWidget {
  const _BookButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              const Color(0xff196EEE),
            ],
          ),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff0038FF).withOpacity(0.24),
                blurRadius: 15,
                offset: const Offset(0, 6))
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Book Now!',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 10),
        SvgPicture.asset('asset/image/Arrow-Right.svg')
      ]),
    );
  }
}
