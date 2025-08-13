<script lang="ts">
	import ThemeToggle from './ThemeToggle.svelte';
	import { onMount } from 'svelte';
	import { gsap } from 'gsap';
	import { theme } from '$lib/stores/theme';

	let headerRef: HTMLElement;
	let logoRef: HTMLElement;
	let navItems: HTMLElement[] = [];

	onMount(() => {
		// Create sophisticated entrance animation
		const tl = gsap.timeline({ delay: 0.3 });

		// Animate logo with floating effect
		tl.fromTo(
			logoRef,
			{
				y: -50,
				opacity: 0,
				rotationY: -30,
				scale: 0.8
			},
			{
				y: 0,
				opacity: 1,
				rotationY: 0,
				scale: 1,
				duration: 1.2,
				ease: 'back.out(1.2)'
			}
		);

		// Animate nav items with stagger
		tl.fromTo(
			navItems,
			{
				y: -30,
				opacity: 0,
				rotationX: -45
			},
			{
				y: 0,
				opacity: 1,
				rotationX: 0,
				duration: 0.8,
				stagger: 0.1,
				ease: 'power2.out'
			},
			'-=0.6'
		);

		// Header scroll morphing effect
		let isScrolled = false;
		const handleScroll = () => {
			const scrolled = window.scrollY > 80;

			if (scrolled !== isScrolled) {
				isScrolled = scrolled;

				// Check if vibrant theme is active
				const isVibrant = document.documentElement.getAttribute('data-theme') === 'vibrant';

				let backgroundColor, boxShadow;
				if (isVibrant) {
					backgroundColor = scrolled ? 'rgba(255, 255, 255, 0.15)' : 'rgba(255, 255, 255, 0.1)';
					boxShadow = scrolled ? '0 8px 32px rgba(0, 0, 0, 0.2)' : 'none';
				} else {
					backgroundColor = scrolled ? 'rgba(255, 255, 255, 0.98)' : 'rgba(255, 255, 255, 0.95)';
					boxShadow = scrolled ? '0 8px 32px rgba(240, 147, 251, 0.15)' : 'none';
				}

				gsap.to(headerRef, {
					backgroundColor,
					backdropFilter: scrolled ? 'blur(20px)' : 'blur(10px)',
					boxShadow,
					duration: 0.4,
					ease: 'power2.out'
				});
			}
		};

		// Add floating animation to logo
		gsap.to(logoRef, {
			y: -2,
			duration: 2,
			repeat: -1,
			yoyo: true,
			ease: 'power2.inOut'
		});

		window.addEventListener('scroll', handleScroll);

		// Listen for theme changes to update header background
		const unsubscribe = theme.subscribe(() => {
			// Re-trigger the scroll effect to update colors for new theme
			handleScroll();
		});

		return () => {
			window.removeEventListener('scroll', handleScroll);
			unsubscribe();
		};
	});

	const scrollToSection = (sectionId: string) => {
		document.getElementById(sectionId)?.scrollIntoView({ behavior: 'smooth' });
	};

	const addNavRef = (element: HTMLElement) => {
		navItems.push(element);
	};
</script>

<header bind:this={headerRef} class="header">
	<div class="header-content">
		<!-- Artistic Logo with Decorative Elements -->
		<div class="logo-container">
			<a href="#home" bind:this={logoRef} class="logo">
				<span class="logo-text">Nadisya</span>
				<div class="logo-decoration">
					<div class="decoration-dot dot-1"></div>
					<div class="decoration-dot dot-2"></div>
					<div class="decoration-line"></div>
				</div>
			</a>
		</div>

		<!-- Creative Navigation -->
		<nav class="nav">
			<div class="nav-items">
				<button use:addNavRef on:click={() => scrollToSection('work')} class="nav-link">
					<span class="nav-text">Work</span>
					<div class="nav-underline"></div>
				</button>

				<button use:addNavRef on:click={() => scrollToSection('philosophy')} class="nav-link">
					<span class="nav-text">Philosophy</span>
					<div class="nav-underline"></div>
				</button>

				<button use:addNavRef on:click={() => scrollToSection('contact')} class="nav-link">
					<span class="nav-text">Contact</span>
					<div class="nav-underline"></div>
				</button>
			</div>

			<!-- Artistic Theme Toggle Container -->
			<div class="theme-container" use:addNavRef>
				<ThemeToggle />
			</div>
		</nav>

		<!-- Decorative Header Elements -->
		<div class="header-decoration">
			<div class="floating-shape shape-1"></div>
			<div class="floating-shape shape-2"></div>
		</div>
	</div>
</header>

<style>
	.header {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		z-index: 100;
		background: rgba(255, 255, 255, 0.95);
		backdrop-filter: blur(10px);
		border-bottom: 1px solid rgba(240, 147, 251, 0.1);
		transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
	}

	.header-content {
		max-width: var(--container-width);
		margin: 0 auto;
		padding: 1.5rem 2rem;
		display: flex;
		justify-content: space-between;
		align-items: center;
		position: relative;
	}

	/* Artistic Logo Design */
	.logo-container {
		position: relative;
	}

	.logo {
		display: flex;
		align-items: center;
		text-decoration: none;
		position: relative;
		transform-style: preserve-3d;
	}

	.logo-text {
		font-family: var(--font-serif);
		font-size: 1.8rem;
		font-weight: 400;
		color: var(--color-text);
		letter-spacing: -0.02em;
		position: relative;
		z-index: 2;
		transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
	}

	.logo:hover .logo-text {
		color: var(--color-accent);
		transform: translateY(-1px);
	}

	.logo-decoration {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		pointer-events: none;
	}

	.decoration-dot {
		position: absolute;
		width: 4px;
		height: 4px;
		background: linear-gradient(135deg, #f093fb 0%, #8b5cf6 100%);
		border-radius: 50%;
		animation: float 3s ease-in-out infinite;
	}

	.dot-1 {
		top: -15px;
		right: -25px;
		animation-delay: 0s;
	}

	.dot-2 {
		bottom: -15px;
		left: -25px;
		animation-delay: 1.5s;
	}

	.decoration-line {
		position: absolute;
		width: 40px;
		height: 1px;
		background: linear-gradient(90deg, transparent 0%, var(--color-accent) 50%, transparent 100%);
		top: 50%;
		left: 120%;
		transform: translateY(-50%);
		opacity: 0;
		transition: opacity 0.3s ease;
	}

	.logo:hover .decoration-line {
		opacity: 1;
	}

	/* Creative Navigation */
	.nav {
		display: flex;
		align-items: center;
		gap: 3rem;
	}

	.nav-items {
		display: flex;
		align-items: center;
		gap: 2.5rem;
	}

	.nav-link {
		background: none;
		border: none;
		color: var(--color-text-muted);
		font-family: var(--font-sans);
		font-size: 0.9rem;
		font-weight: var(--font-weight-medium);
		letter-spacing: 0.05em;
		text-transform: uppercase;
		cursor: none;
		position: relative;
		padding: 0.5rem 0;
		transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
		transform-style: preserve-3d;
	}

	.nav-text {
		position: relative;
		z-index: 2;
		transition: all 0.3s ease;
	}

	.nav-underline {
		position: absolute;
		bottom: 0;
		left: 0;
		right: 0;
		height: 2px;
		background: linear-gradient(135deg, #f093fb 0%, #8b5cf6 100%);
		transform: scaleX(0);
		transform-origin: left;
		transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
	}

	.nav-link:hover {
		color: var(--color-text);
		transform: translateY(-2px);
	}

	.nav-link:hover .nav-underline {
		transform: scaleX(1);
	}

	.nav-link:hover .nav-text {
		transform: perspective(100px) rotateX(10deg);
	}

	/* Theme Toggle Container */
	.theme-container {
		position: relative;
		padding: 0.5rem;
		border-radius: 50px;
		background: rgba(240, 147, 251, 0.05);
		border: 1px solid rgba(240, 147, 251, 0.1);
		transition: all 0.3s ease;
	}

	.theme-container:hover {
		background: rgba(240, 147, 251, 0.1);
		border-color: rgba(240, 147, 251, 0.2);
		transform: translateY(-1px);
	}

	/* Header Decorative Elements */
	.header-decoration {
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		pointer-events: none;
		overflow: hidden;
	}

	.floating-shape {
		position: absolute;
		border-radius: 50%;
		background: linear-gradient(135deg, rgba(240, 147, 251, 0.3) 0%, rgba(139, 92, 246, 0.3) 100%);
		filter: blur(1px);
		animation: float 6s ease-in-out infinite;
	}

	.shape-1 {
		width: 8px;
		height: 8px;
		top: 20%;
		left: 15%;
		animation-delay: 0s;
	}

	.shape-2 {
		width: 6px;
		height: 6px;
		bottom: 30%;
		right: 25%;
		animation-delay: 3s;
	}

	/* Vibrant Theme Styles */
	:global([data-theme='vibrant']) .header {
		background: rgba(255, 255, 255, 0.1);
		border-bottom-color: rgba(255, 255, 255, 0.2);
	}

	:global([data-theme='vibrant']) .logo-text {
		color: white;
	}

	:global([data-theme='vibrant']) .logo:hover .logo-text {
		color: rgba(255, 255, 255, 0.9);
	}

	:global([data-theme='vibrant']) .nav-link {
		color: rgba(255, 255, 255, 0.8);
	}

	:global([data-theme='vibrant']) .nav-link:hover {
		color: white;
	}

	:global([data-theme='vibrant']) .theme-container {
		background: rgba(255, 255, 255, 0.1);
		border-color: rgba(255, 255, 255, 0.2);
	}

	:global([data-theme='vibrant']) .theme-container:hover {
		background: rgba(255, 255, 255, 0.2);
		border-color: rgba(255, 255, 255, 0.3);
	}

	/* Animations */
	@keyframes float {
		0%,
		100% {
			transform: translateY(0px) rotate(0deg);
		}
		50% {
			transform: translateY(-10px) rotate(180deg);
		}
	}

	/* Mobile Responsive */
	@media (max-width: 768px) {
		.header-content {
			padding: 1rem;
		}

		.nav-items {
			gap: 1.5rem;
		}

		.nav {
			gap: 2rem;
		}

		.logo-text {
			font-size: 1.5rem;
		}

		.nav-link {
			font-size: 0.8rem;
		}

		.floating-shape {
			display: none;
		}
	}
</style>
